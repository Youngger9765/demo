class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.boolean :is_public
      t.integer :capacity
      t.string :fooobarrr
      t.timestamps null: false
    end
  end
end
