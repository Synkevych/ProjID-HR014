require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario "should be successful" do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'john.doe@example.com'
        fill_in 'Password', with: 'examplePass'
        fill_in 'Password confirmation', with: 'examplePass'
      end
      click_button 'Sign up'
      expect(page).to have_content('Logout john.doe@example.com')
    end

    scenario "should fail" do
      visit new_user_registration_path
      within('form') do
      end
      click_button 'Sign up'
      expect(page).to have_content('Email can\'t be blank Password can\'t be blank')
    end

    scenario "should fail password doesen\'t mutch password" do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'john.doe@example.com'
        fill_in 'Password', with: 'examplePass'
      end
      click_button 'Sign up'
      expect(page).to have_content('Password confirmation doesn\'t match Password')
    end

   scenario "should redirect to Log in page" do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'john.doe@example.com'
        fill_in 'Password', with: 'examplePass'
      end
      # click_link 'Log in'
      find("a[href='#{new_user_registration_path}']").click
      expect(page).to have_content('Log in')
    end
  end
  context 'update user' do
  end
  context 'destroy user' do
  end
end
