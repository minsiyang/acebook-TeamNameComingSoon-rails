require 'rails_helper'
require 'web_helpers'

feature 'Delete post' do
  scenario 'user can delete a post' do
    signup
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Delete me!"
    click_button "Share"
    click_link 'Delete'
    expect(page).to_not have_content("Delete me!")
    expect(page).to have_content("Your post was deleted!")
  end
end

feature 'Update post' do
  scenario 'user can Update a post' do
    signup
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Update me!"
    click_button "Share"
    click_link 'Edit'
    fill_in "Message", with: "I'm changed I promise!!!"
    click_button "Share"
    expect(page).to have_content("I'm changed I promise!!!")
    expect(page).to_not have_content('Update me!')
    expect(page).to have_content("Your post was updated!")
  end
end

feature 'Update post after 10 mins' do
  
  before do
    travel_to Time.zone.local(2019, 11, 24, 01, 04, 44)
  end

  scenario 'User cant update a post after 10 mins' do
    signup
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Update me!"
    click_button "Share"
    travel_back
    visit "/posts"
    expect(page).to_not have_link("Edit")
  end
end

