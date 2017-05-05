require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create!(email: "molly@molly.com", password: "password")

    visit login_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    click_button "Login"

    fill_in "Url", with: "http://www.google.com"
    fill_in "Title", with: "Google"
    click_button "Add Link"

    expect(page).to have_text("false")

    click_on "Mark as Read"

    expect(page).to have_text("true")

    click_on "Mark as Unread"

    expect(page).to have_text("false")
  end
end
