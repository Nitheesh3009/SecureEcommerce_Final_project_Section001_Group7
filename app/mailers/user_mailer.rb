class UserMailer < Devise::Mailer

  def send_otp(user_id)
    @user = User.find(user_id)

    mail from: "humbleabodeatdenton@gmail.com",  to: @user.email, subject: "OTP for login"
  end

  def welcome_email(user_id)
    @user = User.find(user_id)

    mail from: "humbleabodeatdenton@gmail.com",  to: @user.email, subject: "Welcome"
  end

  def reset_password_instructions(record, token, opts={})
    super
  end
end
