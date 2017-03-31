require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category title" do
    category = Category.create(title: "finance")

    visit category_path(category.id)

    expect(current_path).to eq(category_path(category.id))
    expect(page).to have_content("finance")
  end

  scenario "a user sees that category's jobs" do
    category = Category.create(title: "Developer")
    company = Company.create(name: "Amazon")
    company.jobs.create(title: "Developer", description: "stuff", level_of_interest: 70, city: "Denver", category_id: category.id)
    company.jobs.create(title: "Web Guru", description: "webby", level_of_interest: 10, city: "Seattle", category_id: category.id)


    visit category_path(category.id)

    expect(current_path).to eq(category_path(category.id))
    expect(page).to have_content("Developer at Amazon")
    expect(page).to have_content("Web Guru at Amazon")
  end
end