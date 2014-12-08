# == Schema Information
#
# Table name: kids
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  age             :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  motherFirstName :string(255)
#  motherLastName  :string(255)
#  fatherFirstName :string(255)
#  fatherLastName  :string(255)
#  address         :string(255)
#  phone           :string(255)
#  email           :string(255)
#  likings         :text
#  badHabbits      :text
#  words           :text
#  specificFood    :string(255)
#  allergies       :string(255)
#  other           :text
#

class Kid < ActiveRecord::Base
end
