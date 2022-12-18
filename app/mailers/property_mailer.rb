class PropertyMailer < ApplicationMailer

  def send_reminder(user_property_id)
    @user_property = UserProperty.find(user_property_id)

    mail  to: @user_property.user.email, subject: "Remider email"
  end
end
