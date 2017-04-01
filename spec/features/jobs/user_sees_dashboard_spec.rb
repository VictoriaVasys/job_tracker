require 'rails_helper'

describe "User sees dashboard metrics" do
  scenario "a user sees all job and company metrics" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 6, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 5, city: "New York City")
    company.jobs.create(title: "Software Engineer", level_of_interest: 9, city: "Denver")
    company2 = Company.create(name: "Amazon")
    company2.jobs.create!(title: "Web Developer", level_of_interest: 5, city: "Seattle")
    company2.jobs.create!(title: "Data Scientist", level_of_interest: 8, city: "New York City")
    company3 = Company.create(name: "Turing")
    company3.jobs.create!(title: "Instructor", level_of_interest: 7, city: "Denver")

    visit dashboard_path

    expect(page).to have_content("Top Companies By Level of Interest")
    within(".company-interest") do
      expect(page.find('tr:nth-child(2)')).to have_content("Turing")
      expect(page.find('tr:nth-child(3)')).to have_content("ESPN")
      expect(page.find('tr:nth-child(4)')).to have_content("Amazon")
    end

    expect(page).to have_content("Number of Jobs by Level of Interest")
    within(".job-interest") do
      expect(page).to have_content("9 1")
      expect(page).to have_content("8 1")
      expect(page).to have_content("7 1")
      expect(page).to have_content("6 1")
      expect(page).to have_content("5 2")
    end

    expect(page).to have_content("Number of Jobs by location")
    within(".job-location") do
      expect(page).to have_content("Denver 3")
      expect(page).to have_content("New York City 2")
      expect(page).to have_content("Seattle 1")
    end

  end
end
