# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  confirmed              :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :authentications, :dependent => :destroy
  has_many :children, dependent: :destroy
  has_many :messages, dependent: :destroy
  after_update :send_email, :if => :confirmed_changed?

  # def initialize
  #   self.confirmed = false
  # end
  # TODO

  def admin?
    self.email == "vinti.uiet@gmail.com" || self.email == "parryg@hotmail.com"
  end

  def confirmed?
    confirmed
  end

  def send_email
    if self.confirmed
      UserMailer.account_confirmation(self).deliver
    end
  end
end
