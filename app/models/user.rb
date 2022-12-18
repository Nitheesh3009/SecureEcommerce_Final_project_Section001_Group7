class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :user_properties, dependent: :destroy

  after_create :send_welcome_email

  def generate_and_send_otp
    self.otp = SecureRandom.random_number(10**6).to_s.rjust(6, '0')
    self.save
    UserMailer.send_otp(id).deliver_now
  end

  def send_welcome_email
    UserMailer.welcome_email(id).deliver_now
  end
end
