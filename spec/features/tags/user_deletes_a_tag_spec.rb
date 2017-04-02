require 'rails_helper'

describe "User deletes existing tag" do
  scenario "a user can delete a tag" do
    tag = Tag.create(title: "Applied")

    visit tags_path

    click_link "Delete"

    expect(page).to_not have_content("Applied")
  end
end