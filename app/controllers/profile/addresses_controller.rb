class Profile::AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    current_user.addresses << Address.create(address_params)
    flash[:success] = "Your new address has been added."
    redirect_to profile_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    @address.save
    flash[:success] = "Your address has been updated."
    redirect_to profile_path
  end

  def destroy
    @address = Address.find(params[:id])
    
    @address.destroy
    flash[:success] = "Your address has been deleted."
    redirect_to profile_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end

end
