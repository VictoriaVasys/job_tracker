class Tag < ActiveRecord::Base
  has_many :job_tags
  has_many :jobs, through: :job_tags

  validates :title, presence: true
  validates :title, uniqueness: true

end