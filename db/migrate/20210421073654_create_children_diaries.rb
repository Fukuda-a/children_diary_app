class CreateChildrenDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :children_diaries do |t|
      t.text :living
      t.text :health
      t.text :visit
      t.text :information
      t.references :children, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
