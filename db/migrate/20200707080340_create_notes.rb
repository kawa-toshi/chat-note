class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :theme
      t.text :details
      
      t.timestamps
    end
  end
end
