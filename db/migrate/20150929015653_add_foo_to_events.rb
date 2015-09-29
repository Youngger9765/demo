class AddFooToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :status, :string
  	add_column :events, :foo, :string
  end
end
