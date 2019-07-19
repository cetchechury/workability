require 'rails_helper'

feature "User signs in and adds new place with form" do
  User.destroy_all
  user = FactoryBot.create(:user)

  scenario 'user fills out form correctly' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit '/places/new'
    fill_in 'Name', with: 'Chuck E. Cheese'
    fill_in 'Description', with: 'germ time'
    select 'Library', from: 'Type'
    select 'Somerville', from: 'Neighborhood'
    choose 'place_wifi_valuetrue' # use id for radio button
    choose 'place_food_valuefalse'
    choose 'place_outdoor_seating_valuetrue'
    choose 'place_standing_options_valuefalse'
    fill_in 'Address', with: '238 Meatball Ave'
    fill_in 'City', with: 'Spaghetti'
    fill_in 'State', with: 'MA'
    fill_in 'Zip', with: '89267'

    click_button 'Add a Place'

    expect(page).to have_content("Chuck E. Cheese")
    expect(page).to have_content("Somerville")
  end

  scenario 'user does not fill out some fields' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit '/places/new'
    fill_in 'Name', with: 'Chuck E. Cheese'
    select 'Library', from: 'Type'
    choose 'place_wifi_valuetrue'
    choose 'place_food_valuefalse'
    choose 'place_outdoor_seating_valuetrue'
    fill_in 'Address', with: '238 Meatball Ave'
    fill_in 'City', with: 'Spaghetti'
    fill_in 'State', with: 'MA'
    fill_in 'Zip', with: '89267'

    click_button 'Add a Place'

    expect(page).to have_content("Please fill out correctly!")
  end
end
