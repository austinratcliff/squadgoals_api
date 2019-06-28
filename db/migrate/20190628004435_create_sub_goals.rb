class CreateSubGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_goals do |t|
      t.integer :goal_id, null: false
      t.text :content, null: false
      t.boolean :is_complete, null: false

      t.timestamps
    end
  end
end
