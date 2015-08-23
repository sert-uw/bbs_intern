class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name
      t.string :address
      t.string :body
      t.string :password

      t.timestamps null: false
    end
  end
end
