require 'rails_helper'

RSpec.feature "User can create a new account", type: :feature do
  scenario "User creates a new account" do

    visit new_user_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button  "Create Account"

    expect(current_path).to eq '/'
    assert page.has_content?("Sign Out")
    refute page.has_content?("Sign In")
  end
end
