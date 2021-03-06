require 'rails_helper'

describe "User sees jobs by interest level" do
  scenario "a user sees all jobs by interest" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 6, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 5, city: "New York City")
    company.jobs.create(title: "Software Engineer", level_of_interest: 9, city: "Denver")
    company2 = Company.create(name: "Amazon")
    company2.jobs.create!(title: "Web Developer", level_of_interest: 5, city: "Seattle")
    company2.jobs.create!(title: "Data Scientist", level_of_interest: 8, city: "New York City")
    company3 = Company.create(name: "Turing")
    company3.jobs.create!(title: "Instructor", level_of_interest: 7, city: "Denver")

    visit "/jobs?sort=interest"

    expect(page).to have_content("Jobs by Level of Interest")
    expect(page).to have_content("9 Software Engineer at ESPN")
    expect(page).to have_content("8 Data Scientist at Amazon")
    expect(page).to have_content("7 Instructor at Turing")
    expect(page).to have_content("6 Developer at ESPN")
    expect(page).to have_content("5 QA Analyst at ESPN")
    expect(page).to have_content("5 Web Developer at Amazon")
  end
end