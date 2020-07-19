class AddUserIdToConnections < ActiveRecord::Migration[6.0]
  def change
    add_column :connections, :user_id, :integer
  end
end
