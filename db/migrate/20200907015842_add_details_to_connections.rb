class AddDetailsToConnections < ActiveRecord::Migration[6.0]
  def change
    add_column :connections, :preference, :text
    add_column :connections, :dislike, :text
  end
end
