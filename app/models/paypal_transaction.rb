class PaypalTransaction < ApplicationRecord
  belongs_to :user_property
  before_create :set_date

  def set_date
    self.date = Date.current
  end
end
