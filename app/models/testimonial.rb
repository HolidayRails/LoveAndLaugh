class Testimonial < ActiveRecord::Base
  validate :entry, :presence => true
  belongs_to :user
end
