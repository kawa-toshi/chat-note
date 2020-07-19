class RemoveTagIdFromNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :notes, :tag_id, :integer
  end
end
