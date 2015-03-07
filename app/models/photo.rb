# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#

class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

end
