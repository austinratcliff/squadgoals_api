class CreateCollaborationGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :collaboration_goals do |t|
      t.integer :project_id, null: false
      t.integer :requester_goal_id, null: false
      t.integer :requestee_goal_id, null: false

      t.timestamps
    end
  end
end
