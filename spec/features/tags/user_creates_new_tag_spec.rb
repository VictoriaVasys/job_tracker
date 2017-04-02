require 'rails_helper'

describe "User creates a new tag" do
  scenario "a user can create a new tag" do
    visit new_tag_path

    fill_in "tag[title]", with: "Interview Scheduled"
    click_button "Create Tag"

    expect(current_path).to eq(tags_path)
    expect(page).to have_content("Interview Scheduled")
    expect(Tag.count).to eq(1)
  end
end