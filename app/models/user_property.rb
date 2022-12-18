class UserProperty < ApplicationRecord

  belongs_to :property
  belongs_to :user

  has_many :paypal_transactions, dependent: :destroy

  before_create :set_date
  after_save :update_property

  enum status: [:in_progress, :cancelled]

  def set_date
    self.date = Date.current
    self.next_billing_date = (Date.current + property.rent_payment_days.to_i)
  end

  def update_property
    if self.in_progress?
      self.property.update_column(:in_rent, true)
    elsif self.cancelled?
      self.property.update_column(:in_rent, false)
    end
  end
end
