class Photo < ApplicationRecord
  belongs_to :user
  mount_uploaders :photos, PhotosUploader
  serialize :photos, JSON # If you use SQLite, add this line.
  has_many :likes, dependent: :destroy
  has_many :comments
end
