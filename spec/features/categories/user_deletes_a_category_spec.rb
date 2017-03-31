require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "finance")
    visit categories_path

    click_link "Delete"

    expect(page).to_not have_content("finance")
  end
end