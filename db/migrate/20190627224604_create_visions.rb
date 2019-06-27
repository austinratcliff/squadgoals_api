class CreateVisions < ActiveRecord::Migration[5.2]
  def change
    create_table :visions do |t|
      t.integer :user_id, null: false
      t.text :statement, null: false
      t.integer :timeframe, null: false

      t.timestamps
    end
  end
end
