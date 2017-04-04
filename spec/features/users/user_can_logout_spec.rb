require 'rails_helper'

RSpec.feature "User can log out", type: :feature do
  scenario "registered user can log out" do
    user = User.create!(email: "molly@molly.com", password: "password")

    visit login_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq('/')
    assert page.has_content?("Sign Out")
    assert page.has_content?("Login Successful!")
    refute page.has_content?("Sign In")

    click_link "Sign Out"

    expect(current_path).to eq('/login')
    assert page.has_content?("Log In or Sign Up")
  end
end
