require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company and it's jobs" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  scenario "a user sees the company's contact"do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")
    company.contacts.create(first_name: "Jane", last_name: "Smith", position: "HR Manager", email: "jane@espn.com")
    visit company_path(company)

    expect(page).to have_content("Jane Smith, HR Manager - jane@espn.com")
  end

  scenario "a user sees a form to create new contact" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    fill_in "contact[first_name]", with: "Jane"
    fill_in "contact[last_name]", with: "Smith"
    fill_in "contact[position]", with: "HR Director"
    fill_in "contact[email]", with: "jane@espn.com"

    click_button "Create Contact"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content("Jane Smith, HR Director - jane@espn.com")
  end
end
