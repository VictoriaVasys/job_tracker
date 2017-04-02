require 'rails_helper'

describe "User sees one tag" do
  scenario "a user sees a tag title" do
    tag = Tag.create(title: "Applied")

    visit tag_path(tag.id)

    expect(current_path).to eq(tag_path(tag.id))
    expect(page).to have_content("Applied")
  end

  scenario "a user sees that tag's jobs" do
    company = Company.create(name: "Amazon")
    job = company.jobs.create(title: "Developer", description: "stuff", level_of_interest: 70, city: "Denver")
    tag = job.tags.create(title: "applied")

    visit tag_path(tag.id)

    expect(current_path).to eq(tag_path(tag.id))
    expect(page).to have_content("Developer at Amazon")
  end
end