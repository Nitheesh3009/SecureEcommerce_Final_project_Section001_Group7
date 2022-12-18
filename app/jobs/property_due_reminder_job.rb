class PropertyDueReminderJob < ApplicationJob
  queue_as :default

  def perform
    UserProperty.all.each do |user_property|
      PropertyMailer.send_reminder(user_property.id).deliver_now if (user_property.next_billing_date + 1) >= Date.current
    end
  end
end
