class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])  # per_page value is defined in application_controller
  end

  def show
    @user = User.find(params[:id])
#    debugger
#    redirect_to root_url and return unless FILL_IN  # show only active users
    @rooms = @user.rooms.paginate(page: params[:page])
  end
    


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.information
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Überprüfen Sie bitte Ihren Emaileingang, um Ihren Zugang zu aktivieren.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profil aktualisiert'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Benutzer entfernt!"
    redirect_to users_url
  end

  private

    # do not include here :admin
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :information)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
