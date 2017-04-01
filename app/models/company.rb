class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.companies_by_interest
    interest = {}
    all.each do |c|
      interest[c.name] = c.jobs.average_interest
    end
    interest.compact
  end

  def self.sorted_companies_by_interest
    companies_by_interest.sort_by{|k,v| v}.reverse
  end
end
