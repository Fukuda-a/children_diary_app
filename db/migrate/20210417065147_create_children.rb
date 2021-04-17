class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.string :name
      t.string :birthday
      t.string :child_centers_name
      t.integer :child_number

      t.timestamps
    end
  end
end
