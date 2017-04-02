require 'rails_helper'

describe "User edits an existing tag" do
  scenario "a user can edit a tag" do
    tag = Tag.create(title: "Apply")

    visit edit_tag_path(tag)

    fill_in "tag[title]", with: "Applied"

    click_button "Update Tag"

    expect(current_path).to eq("/tags")
    expect(page).to have_content("Applied")
  end
end