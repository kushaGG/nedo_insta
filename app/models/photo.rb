class Photo < ApplicationRecord
  belongs_to :user
  mount_uploaders :photos, PhotosUploader
  serialize :photos, JSON # If you use SQLite, add this line.

end
