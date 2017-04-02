class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :job_tags
  has_many :tags, through: :job_tags

  def self.interest
    group(:level_of_interest).count(:id)
  end

  def self.average_interest
    average(:level_of_interest)
  end

  def self.find_interest
    select(:level_of_interest).pluck(:level_of_interest).uniq
  end

  def self.jobs_by_level_of_interest
    find_interest.map do |i|
      where(level_of_interest: i)
    end
  end

  def self.location_count
    group(:city).count(:id)
  end

  def self.find_cities
    select(:city).pluck(:city).uniq
  end

  def self.jobs_by_city
    find_cities.map do |city|
      where(city: city)
    end
  end

  def self.jobs_for_city(location)
    where(city: location)
  end

  def self.find_companies
    select(:company_id).pluck(:company_id).uniq
  end

  def self.jobs_by_company
    find_companies.map do |company|
      where(company_id: company)
    end
  end
end
