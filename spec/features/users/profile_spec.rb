require 'rails_helper'

RSpec.describe 'user profile', type: :feature do
  before :each do
    @user = create(:user, email: "user1@gmail.com", password: "password")

    @address1 = create(:address, user: @user)
    @address2 = create(:address, user: @user)

    @order = create(:order, user: @user, address: @address1, status: 'shipped')
  end

  describe 'registered user visits their profile' do
    it 'shows user information with addresses' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit profile_path

      within '#profile-data' do
        expect(page).to have_content("Role: #{@user.role}")
        expect(page).to have_content("Email: #{@user.email}")
        expect(page).to have_link('Edit Profile Data')
      end
      within '#address-data' do
        expect(page).to have_content('Your Addresses')
        within "#address-details-#{@address1.id}" do
          expect(page).to have_content("#{@address1.street}")
          expect(page).to have_content("#{@address1.city}, #{@address1.state} #{@address1.zip}")
          expect(page).to have_link("Edit")
          expect(page).to have_link("Delete")
        end
        within "#address-details-#{@address2.id}" do
          expect(page).to have_content("#{@address2.street}")
          expect(page).to have_content("#{@address2.city}, #{@address2.state} #{@address2.zip}")
          expect(page).to have_link("Edit")
          expect(page).to have_link("Delete")
        end
      end
    end
  end

  describe 'registered user edits their addresses' do
    it 'creates address' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit profile_path

      within '#address-data' do
        click_link 'Add New Address'
      end

      expect(current_path).to eq('/profile/addresses/new')
      fill_in "Name", with: "work"
      fill_in "Street", with: "987 Sesame St"
      fill_in "City", with: "Brooklyn"
      fill_in "State", with: "NY"
      fill_in "Zip", with: "73733"
      click_button 'Submit'

      expect(current_path).to eq('/profile')

      within '#address-data' do
        expect(page).to have_content("work")
        expect(page).to have_content("987 Sesame St")
        expect(page).to have_content("Brooklyn")
        expect(page).to have_content("NY")
        expect(page).to have_content("73733")
      end
    end

    it 'cannot create address without all required fields filled in' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit profile_path

      within '#address-data' do
        click_link 'Add New Address'
      end

      expect(current_path).to eq('/profile/addresses/new')
      fill_in "Name", with: "work"
      fill_in "City", with: "Brooklyn"
      fill_in "State", with: "NY"
      fill_in "Zip", with: "73733"
      click_button 'Submit'

      expect(current_path).to eq('/profile/addresses')
      expect(page).to have_content("The address you entered is missing required fields.")
    end

    it 'edits address info' do
      visit root_path

      click_link "Log in"

      fill_in "Email", with: "user1@gmail.com"
      fill_in "Password", with: "password"
      click_button "Log in"

      within '#address-data' do
        within "#address-details-#{@address2.id}" do
          click_link 'Edit'
        end
      end

      expect(current_path).to eq(edit_profile_address_path(@address2.id))
      fill_in "Name", with: "Grandma's House"
      fill_in "Street", with: "2468 Whodoweappreciate"
      fill_in "City", with: "Minneapolis"
      fill_in "State", with: "MN"
      fill_in "Zip", with: "13579"
      click_button 'Submit'

      expect(current_path).to eq('/profile')

      within '#address-data' do
        expect(page).to have_content("Grandma's House")
        expect(page).to have_content("2468 Whodoweappreciate")
        expect(page).to have_content("Minneapolis")
        expect(page).to have_content("MN")
        expect(page).to have_content("13579")
      end
    end

    it 'cannot edit address that is used in a completed order' do
      visit root_path

      click_link "Log in"

      fill_in "Email", with: "user1@gmail.com"
      fill_in "Password", with: "password"
      click_button "Log in"

      within '#address-data' do
        within "#address-details-#{@address1.id}" do
          click_link 'Edit'
        end
      end

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Your address has been used in a completed order and cannot be updated.")
    end

    it 'deletes address' do
      visit root_path

      click_link "Log in"

      fill_in "Email", with: "user1@gmail.com"
      fill_in "Password", with: "password"
      click_button "Log in"

      within "#address-details-#{@address2.id}" do
        click_link 'Delete'
      end

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Your address has been deleted.")
      expect(page).to_not have_css("#address-details-#{@address2.id}")
      expect(page).to_not have_content(@address2.street)
    end

    it 'cannot delete address that is used in a completed order' do
      visit root_path

      click_link "Log in"

      fill_in "Email", with: "user1@gmail.com"
      fill_in "Password", with: "password"
      click_button "Log in"

      within '#address-data' do
        within "#address-details-#{@address1.id}" do
          click_link 'Delete'
        end
      end

      expect(current_path).to eq('/profile')
      expect(page).to have_content("Your address has been used in a completed order and cannot be deleted.")
    end

  end

  describe 'registered user edits their profile' do
    describe 'edit user form' do
      it 'pre-fills form with all but password information' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

        visit profile_path

        click_link 'Edit Profile Data'

        expect(current_path).to eq('/profile/edit')
        expect(find_field('Name').value).to eq(@user.name)
        expect(find_field('Email').value).to eq(@user.email)
        expect(find_field('Password').value).to eq(nil)
        expect(find_field('Password confirmation').value).to eq(nil)
      end
    end

    describe 'user information is updated' do
      before :each do
        @updated_name = 'Updated Name'
        @updated_email = 'updated_email@example.com'
        @updated_password = 'newandextrasecure'
      end

      describe 'succeeds with allowable updates' do
        scenario 'all attributes are updated' do
          login_as(@user)
          old_digest = @user.password_digest

          visit edit_profile_path

          fill_in :user_name, with: @updated_name
          fill_in :user_email, with: @updated_email
          fill_in :user_password, with: @updated_password
          fill_in :user_password_confirmation, with: @updated_password

          click_button 'Submit'

          updated_user = User.find(@user.id)

          expect(current_path).to eq(profile_path)
          expect(page).to have_content("Your profile has been updated")
          expect(page).to have_content("#{@updated_name}")
          within '#profile-data' do
            expect(page).to have_content("Email: #{@updated_email}")
          end
          expect(updated_user.password_digest).to_not eq(old_digest)
        end
        scenario 'works if no password is given' do
          login_as(@user)
          old_digest = @user.password_digest

          visit edit_profile_path

          fill_in :user_name, with: @updated_name
          fill_in :user_email, with: @updated_email

          click_button 'Submit'

          updated_user = User.find(@user.id)

          expect(current_path).to eq(profile_path)
          expect(page).to have_content("Your profile has been updated")
          expect(page).to have_content("#{@updated_name}")
          within '#profile-data' do
            expect(page).to have_content("Email: #{@updated_email}")
          end
          expect(updated_user.password_digest).to eq(old_digest)
        end
      end
    end

    it 'fails with non-unique email address change' do
      create(:user, email: 'megan@example.com')
      login_as(@user)

      visit edit_profile_path

      fill_in :user_email, with: 'megan@example.com'

      click_button 'Submit'

      expect(page).to have_content("Email has already been taken")
    end
  end
end
