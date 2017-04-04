require 'rails_helper'

RSpec.feature "User can create a link", type: :feature do
  scenario "registered user can create a new link" do
    user = User.create!(email: "molly@molly.com", password: "password")

    visit login_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Title", with: "Google"
    click_button "Add Link"

    expect(current_path).to eq('/')

    within('.link') do
      expect(page).to have_text("Title: Google")
      expect(page).to have_text("URL: http://www.google.com")
      expect(page).to have_text("Read?: false")
    end

  end

  scenario "registered user can only see their own links" do
    user_1 = User.create!(email: "molly@molly.com", password: "password")
    user_2 = User.create!(email: "erin@erin.com", password: "password")
    user_2_link = Link.create!(url: "http://www.google.com", title: "Google", user_id: user_1.id)
    user_2_link = Link.create!(url: "http://www.test.com", title: "test", user_id: user_2.id)

    visit login_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/"

    within('.link') do
      expect(page).to have_text("Title: Google")
      expect(page).to have_text("URL: http://www.google.com")
      expect(page).to have_text("Read?: false")

      expect(page).to_not have_text("Title: test")
      expect(page).to_not have_text("URL: http://www.test.com")
    end

  end
end
