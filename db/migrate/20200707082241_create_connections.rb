class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.string :name
      t.text :details
      
      t.timestamps
    end
  end
end
