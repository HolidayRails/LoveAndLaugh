class Gallery < ActiveRecord::Base
  attr_accessible :name
  has_many :photos

end
