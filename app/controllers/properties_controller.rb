class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :buy]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @properties = Property.where(in_rent: false)
  end

  def buy
  end

  def create
    @user_property = UserProperty.new
    @user_property.property_id = params[:property_id]
    @user_property.user = current_user

    if @user_property.save
      paypal_transaction = @user_property.paypal_transactions.new
      paypal_transaction.order_id = params[:order_id]
      paypal_transaction.save
    end
  end

  def show
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
end
