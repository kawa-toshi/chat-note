class AddImageToConnections < ActiveRecord::Migration[6.0]
  def change
    add_column :connections, :image, :text
  end
end
