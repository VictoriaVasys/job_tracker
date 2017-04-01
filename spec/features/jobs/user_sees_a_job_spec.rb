require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Engineering")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user sees comments for that job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Engineering")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job.comments.create(content: "Spoke with hiring manager on Tuesday")
    visit company_job_path(company, job, job.comments)

    expect(page).to have_content("Spoke with hiring manager on Tuesday")
  end

  scenario "a user sees form to create new comment" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Engineering")

    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Spoke with hiring manager on Wednesday"

    click_button "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{job.id}")

    expect(page).to have_content("Spoke with hiring manager on Wednesday")
  end
end
