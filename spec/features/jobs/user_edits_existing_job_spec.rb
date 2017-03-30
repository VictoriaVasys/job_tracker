require 'rails_helper'

describe "User edits an job company" do
  scenario "a user can edit a company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[level_of_interest]", with: "50"
    click_button "Update"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{job.id}")
    expect(page).to have_content("50")
  end
end