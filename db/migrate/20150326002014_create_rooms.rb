class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|

      t.references :user, index: true

# :presence => true

      t.string  :name
      t.string  :strasse
      t.string  :nummer
      t.integer :plz, :default => '81829'
      t.string  :ort, :default => 'München'
      t.integer :groesse
      t.integer :pers_anzahl, :default => 10
      t.string  :anbieter
      t.string  :preis
      t.string  :kontakt_name
      t.string  :kontakt_email
      t.string  :kontakt_telefon
      t.text    :beschreibung
      
# optional

      t.string :mrbs_link
      t.string :weblink

      t.boolean :lage_eingang, :default => false
      t.boolean :lage_garten, :default => false
      t.boolean :lage_mvv, :default => false
      t.boolean :lage_parkplatz, :default => false
      t.text    :anm_lage

      t.boolean :ausstattung_buehne, :default => false
      t.boolean :ausstattung_dunkel, :default => false
      t.boolean :ausstattung_klavier, :default => false
      t.boolean :moebel_entfernbar, :default => false
      t.integer :anzahl_stuehle
      t.integer :anzahl_tische
      t.text    :anm_ausstattung

      t.boolean :technik_disko, :default => false
      t.boolean :technik_mikro, :default => false
      t.boolean :technik_projektion, :default => false
      t.boolean :technik_wlan, :default => false
      t.text    :anm_technik

      t.boolean :verpflegung_catering, :default => false
      t.boolean :verpflegung_gastro, :default => false
      t.boolean :verpflegung_selbst, :default => false
      t.boolean :verpflegung_teekueche, :default => false
      t.text    :anm_verpflegung

      t.boolean :zielgruppe_barrierefrei, :default => false
      t.boolean :zielgruppe_kinder, :default => false
      t.boolean :zielgruppe_party, :default => false
      t.boolean :zielgruppe_seminar, :default => false
      t.text    :anm_zielgruppe

      t.string :bestuhlungsplan
      t.string :grundriss
      t.string :nutzungsvertrag
      t.text   :anm_dokumente
      
      t.string :picture
      t.string :picture2
      t.string :picture3
      t.string :picture4
      t.text   :anm_bilder

      t.string :created_by
      t.string :changed_by

      t.timestamps null: false
    end

#    add_foreign_key :rooms, :users  # conflict with mysql2
    add_index :rooms, [:user_id, :created_at]
    #add_foreign_key :rooms, :users, column: :user_id
  end

end
