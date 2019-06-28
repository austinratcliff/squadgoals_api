class CreateSquadMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :squad_members do |t|
      t.integer :squad_id, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
  end
end
