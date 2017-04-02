class JobTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :job 
end