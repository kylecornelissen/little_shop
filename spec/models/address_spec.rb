require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :street }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'instance methods' do
    before :each do
      @user_1 = create(:user)

      @address_1 = create(:address, user: @user_1)
      @address_2 = create(:address, user: @user_1)

      @order_1 = create(:order, address: @address_1, user: @user_1, status: 'shipped')
      @order_2 = create(:order, address: @address_1, user: @user_1)
    end

    it '#used_in_completed_order' do
      expect(@address_1.used_in_completed_order).to eq(true)
      expect(@address_2.used_in_completed_order).to eq(false)
    end
  end
end
