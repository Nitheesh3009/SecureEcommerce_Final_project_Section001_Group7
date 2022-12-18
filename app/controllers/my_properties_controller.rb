class MyPropertiesController < ApplicationController
  before_action :set_user_property, only: [:show, :cancel, :pay, :create_pay]

  def index
    @user_properties = UserProperty.where(user_id: current_user.id)
  end

  def show
    @property = @user_property.property
  end

  def pay
    redirect_to my_properties_path, alert: "Rent payment for next month is not opened" if Date.current < @user_property.next_billing_date
    @property = @user_property.property
  end

  def create_pay
    paypal_transaction = @user_property.paypal_transactions.new
    paypal_transaction.order_id = params[:order_id]
    paypal_transaction.save
  end

  def cancel
    @user_property.cancelled!
    redirect_to my_properties_path, notice: "Property cancelled successfully."
  end

  private

  def set_user_property
    @user_property = UserProperty.find(params[:id])
  end
end
