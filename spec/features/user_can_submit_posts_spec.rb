require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Share"
    expect(page).to have_content(Time.now.strftime("%d %b %y"))
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can't create post with empty message" do
    visit "/posts/new"
    fill_in "Message", with: ""
    click_button "Share"
    expect(page).to have_content("error")
  end
end