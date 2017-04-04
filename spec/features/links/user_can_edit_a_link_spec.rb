require 'rails_helper'

RSpec.feature "User can edit a link", type: :feature do
  scenario "registered user can edit an existing link" do
    user = User.create!(email: "molly@molly.com", password: "password")
    link = Link.create!(url: "http://www.google.com", title: "Google", user_id: user.id)

    visit login_path
    fill_in "Email", with: "molly@molly.com"
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/"
    click_button "Edit"

    expect(current_path).to eq("/links/#{link.id}/edit")

    fill_in "Title", with: "GOOGLE"
    click_button "Update Link"

    expect(current_path).to eq('/')

    within('.link') do
      expect(page).to have_text("Title: GOOGLE")
      expect(page).to_not have_text("Title: Google")
      expect(page).to have_text("URL: http://www.google.com")
      expect(page).to have_text("Read?: false")
    end

  end
end
