class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :street, :city, :state, :zip

  def used_in_completed_order
    Order.exists?(address: self, status: 'shipped')
  end
end
