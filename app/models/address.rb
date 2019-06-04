class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :street, :city, :state, :zip
end
