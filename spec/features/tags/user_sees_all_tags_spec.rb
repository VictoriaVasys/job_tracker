require 'rails_helper'

describe "User sees all tags" do
  scenario "a user sees all the tags" do
    Tag.create(title: "Applied")
    Tag.create(title: "Phone Interview")
    visit tags_path

    expect(page).to have_content("Applied")
    expect(page).to have_content("Phone Interview")
  end

end