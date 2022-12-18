class Property < ApplicationRecord

  validates_presence_of :name, :description, :owner_name

  has_many_attached :images

  has_many :user_properties, dependent: :destroy
end
