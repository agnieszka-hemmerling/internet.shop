require 'file_size_validator' 
class Product < ActiveRecord::Base
	
	belongs_to :category
	mount_uploader :avatar, AvatarUploader 
#	validates_file_size_of :avatar, :maximum => 1.megabytes.to_i
	validates :avatar, :file_size => {:maximum =>  1.megabytes.to_i}
end
