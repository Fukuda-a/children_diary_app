class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :girl
      t.string :boy
      t.string :baby
      t.integer :group_number

      t.timestamps
    end
  end
end
