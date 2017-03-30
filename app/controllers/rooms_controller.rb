class RoomsController < ApplicationController

protect_from_forgery :except => :suche

  #before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: :destroy

  def index
#    @rooms = Room.paginate(page: params[:page])  # per_page value is defined in application_controller
#    @q = Room.ransack(params[:q].try(:merge, m: 'or'))
    @q = Room.ransack(params[:q])
    @rooms = @q.result.paginate(page: params[:page])
    @count = @rooms.count
  end
  
  def show_room
    @room = Room.find(params[:id])
  end
 

  def suche_old
    @q = Room.ransack(params[:q])
    @rooms = @q.result.paginate(page: params[:page])
  end

  def suche
    index
    render :index
  end
  
  def list_rooms
    index
    render :indexlist
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "Ein neuer Raum wurde erstellt!"
      redirect_to root_url
    else
#      @rooms = current_user.rooms.paginate(page: params[:page])
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    if Room.exists?(id:params[:id])
      @room = Room.find(params[:id])
      @feed_items = current_user.rooms.paginate(page: params[:page])    
    else
      suche  
    end
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "Die Daten wurden gespeichert."
    end
    redirect_to request.referrer || root_url
  end
  


  def destroy
    @room.destroy
    flash[:success] = "Ein Raum wurde entfernt!"
    redirect_to request.referrer || root_url
  end

  private

    def room_params
      params.require(:room).permit( :name, :strasse, :nummer, :plz, :ort, :groesse, :pers_anzahl, :preis, :anbieter, :kontakt_name, :kontakt_email, :kontakt_telefon, :beschreibung,
        :mrbs_link, :weblink,
        :lage_eingang, :lage_garten, :lage_mvv, :lage_parkplatz, :anm_lage,
        :ausstattung_buehne, :ausstattung_dunkel, :ausstattung_klavier, :moebel_entfernbar, :anzahl_stuehle, :anzahl_tische, :anm_ausstattung,
        :technik_disko, :technik_mikro, :technik_projektion, :technik_wlan, :anm_technik,
        :verpflegung_catering, :verpflegung_gastro, :verpflegung_selbst, :verpflegung_teekueche, :anm_verpflegung,
        :zielgruppe_barrierefrei, :zielgruppe_kinder, :zielgruppe_party, :zielgruppe_seminar, :anm_zielgruppe,
        :bestuhlungsplan, :grundriss, :nutzungsvertrag, :anm_dokumente,
        :picture, :picture2, :picture3, :picture4, :anm_bilder,
        )
    end

    def correct_user
      @room = current_user.rooms.find_by(id: params[:id])
      redirect_to root_url if @room.nil?
    end

end
