class CreateProjectSubGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :project_sub_goals do |t|
      t.integer :project_goal_id, null: false
      t.text :content, null: false
      t.boolean :is_complete, null: false

      t.timestamps
    end
  end
end
