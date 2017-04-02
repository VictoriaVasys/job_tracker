class AddJobTagsToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :job_tag, index: true, foreign_key: true
  end
end
