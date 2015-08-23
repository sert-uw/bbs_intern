class CreateBbsThreads < ActiveRecord::Migration
  def change
    create_table :bbs_threads do |t|
      t.string :name
      t.string :address
      t.string :title
      t.string :body
      t.string :password

      t.timestamps null: false
    end
  end
end
