class AddJobTagsToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :job_tag, index: true, foreign_key: true
  end
end
