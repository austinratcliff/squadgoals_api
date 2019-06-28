class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :is_private, null: false

      t.timestamps
    end
  end
end
