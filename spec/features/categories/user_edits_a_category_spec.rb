require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create(title: "finance")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Finance"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Finance")
  end
end