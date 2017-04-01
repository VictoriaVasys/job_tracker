require 'rails_helper'

describe "User sees jobs by location" do
  scenario "a user sees all jobs by locations" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 6, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 5, city: "New York City")
    company.jobs.create(title: "Software Engineer", level_of_interest: 9, city: "Denver")
    company2 = Company.create(name: "Amazon")
    company2.jobs.create!(title: "Web Developer", level_of_interest: 5, city: "Seattle")
    company2.jobs.create!(title: "Data Scientist", level_of_interest: 8, city: "New York City")
    company3 = Company.create(name: "Turing")
    company3.jobs.create!(title: "Instructor", level_of_interest: 7, city: "Denver")

    visit "/jobs?sort=location"

    expect(page).to have_content("Jobs by Location")
    expect(page.find('tr:nth-child(2)')).to have_content("Denver Developer at ESPN")
    expect(page.find('tr:nth-child(3)')).to have_content("Denver Software Engineer at ESPN")
    expect(page.find('tr:nth-child(4)')).to have_content("Denver Instructor at Turing")
    expect(page.find('tr:nth-child(5)')).to have_content("New York City QA Analyst at ESPN")
    expect(page.find('tr:nth-child(6)')).to have_content("New York City Data Scientist at Amazon")
    expect(page.find('tr:nth-child(7)')).to have_content("Seattle Web Developer at Amazon")
  end
end