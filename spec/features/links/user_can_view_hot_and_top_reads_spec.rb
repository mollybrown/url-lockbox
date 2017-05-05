require "rails_helper"

RSpec.describe "can view hot reads", :js => :true do
  scenario "view a link marked as the top link" do
    user = User.create!(email: "molly@molly.com", password: "password")

    visit login_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    click_button "Login"

    fill_in "Url", with: "http://www.google.com"
    fill_in "Title", with: "Google"
    click_button "Add Link"

    click_on "Mark as Read"

    visit("/")

    expect(page).to have_text("TOP LINK!")
  end

  scenario "view a link marked as a hot (but not top) link" do
    user = User.create!(email: "molly@molly.com", password: "password")

    visit login_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    click_button "Login"

    fill_in "Url", with: "http://www.google.com"
    fill_in "Title", with: "Google"
    click_button "Add Link"

    click_on "Mark as Read"
    click_on "Mark as Unread"
    click_on "Mark as Read"

    fill_in "Url", with: "http://www.notgoogle.com"
    fill_in "Title", with: "Not Google"
    click_button "Add Link"

    click_on "Mark as Read"

    visit("/")

    expect(page).to have_text("TOP LINK!")
    expect(page).to have_text("Hot!")
  end
end
