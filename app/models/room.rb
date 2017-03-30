class Room < ActiveRecord::Base

  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :picture2, PictureUploader
  mount_uploader :picture3, PictureUploader
  mount_uploader :picture4, PictureUploader
  
  validates :user_id, presence: true

  validates :name, presence: true
  validates :strasse, presence: true
  validates :nummer, presence: true,
                     length: { maximum: 10 }
  VALID_PLZ_REGEX = /\d\d\d\d\d/
  validates :plz, presence: true,
                  format: { with: VALID_PLZ_REGEX }
  validates :ort, presence: true
  validates :groesse, presence: true,
                      numericality: true
  validates :pers_anzahl, presence: true,
                          numericality: true
  validates :anbieter, presence: true
  validates :preis, presence: true
  validates :kontakt_name, presence: true
  validates :kontakt_email, presence: true
  validates :kontakt_telefon, presence: true
  validates :beschreibung, presence: true

#  validates :technik_mikro, inclusion: { in: [true, false] }
#  validates :technik_wlan, inclusion: { in: [true, false] }

# custom validations

  validate  :picture_size
  validate  :picture2_size
  validate  :picture3_size
  validate  :picture4_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Die Bildgrösse sollte kleiner als 5 MB sein.")
      end
    end

    def picture2_size
      if picture2.size > 5.megabytes
        errors.add(:picture2, "Die Bildgrösse sollte kleiner als 5 MB sein.")
      end
    end

    def picture3_size
      if picture3.size > 5.megabytes
        errors.add(:picture3, "Die Bildgrösse sollte kleiner als 5 MB sein.")
      end
    end

    def picture4_size
      if picture4.size > 5.megabytes
        errors.add(:picture4, "Die Bildgrösse sollte kleiner als 5 MB sein.")
      end
    end

end
