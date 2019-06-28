class CreateCollaborations < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborations do |t|
      t.text :message, null: false
      t.integer :requester_id, null: false
      t.integer :requestee_id, null: false
      t.integer :requester_goal_id, null: false
      t.integer :requestee_goal_id, null: false
      t.integer :request_status_id, null: false

      t.timestamps
    end
  end
end
