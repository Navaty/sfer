class Post < ApplicationRecord
	mount_uploader :image, ImageUploader

	validates :title, :body, presence: true
end
