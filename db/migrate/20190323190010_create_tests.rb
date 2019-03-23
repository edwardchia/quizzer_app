class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description
      t.string :level
      t.string :points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
