class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.integer :number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
