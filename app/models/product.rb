class Product < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader

	belongs_to :user

	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :name, presence: true
	validates :state, presence: true
end
