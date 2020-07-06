require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    signup
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Share"
    expect(page).to have_content(Time.now.strftime("%d %b %y"))
    expect(page).to have_content("Hello, world!")
  end
end