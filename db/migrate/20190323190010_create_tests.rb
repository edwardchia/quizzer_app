class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.text :description
      t.string :level
      t.integer :points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
