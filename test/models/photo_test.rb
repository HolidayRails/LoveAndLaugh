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

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
