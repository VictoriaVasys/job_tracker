require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Engineering")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company.id, job.id)


    click_link "Delete"


    expect(page).to have_content("You successfully deleted Developer at ESPN")
  end
end