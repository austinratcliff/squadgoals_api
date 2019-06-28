class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.text :content, null: false
      t.datetime :by_when, null: false
      t.boolean :is_private, null: false

      t.timestamps
    end
  end
end
