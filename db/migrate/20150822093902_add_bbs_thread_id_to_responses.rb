class AddBbsThreadIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :bbs_thread_id, :integer
  end
end
