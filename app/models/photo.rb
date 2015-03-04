# == Schema Information
#
# Table name: photos
#
#  id               :integer          not null, primary key
#  gallery_id       :integer
#  name             :string(255)
#  image            :string(255)
#  remote_image_url :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Photo < ActiveRecord::Base
  attr_accessible :gallery_id, :name, :image, :remote_image_url
  belongs_to :gallery
  mount_uploader :image, ImageUploader
end
