class AddStatusToEvents < ActiveRecord::Migration
  def change
    add_column :events, :status, :string, :num
  end
end
