class Post < ApplicationRecord
 belongs_to :user
 mount_uploader :room_image, RoomUploader
 has_many :reservations

  def self.search(search)
    if search
      Post.where(['address LIKE ? OR room_profile LIKE ?', "%#{search}%","%#{search}%"])
    end
  end
end
