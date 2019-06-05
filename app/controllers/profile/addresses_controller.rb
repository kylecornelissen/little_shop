class Profile::AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    current_user.addresses << @address
    if @address.save
      flash[:success] = "Your new address has been added."
      redirect_to profile_path
    else
      flash[:danger] = "The address you entered is missing required fields."
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
    if @address.used_in_completed_order
      flash[:danger] = "Your address has been used in a completed order and cannot be updated."
      redirect_to profile_path
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    @address.save
    flash[:success] = "Your address has been updated."
    redirect_to profile_path
  end

  def destroy
    @user = current_user
    @address = Address.find(params[:id])
    if @address.used_in_completed_order
      flash[:danger] = "Your address has been used in a completed order and cannot be deleted."
      redirect_to profile_path
    else
      @user.addresses.delete(@address)
      flash[:success] = "Your address has been deleted."
      redirect_to profile_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end

end
