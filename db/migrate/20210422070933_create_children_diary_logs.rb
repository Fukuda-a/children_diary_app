class CreateChildrenDiaryLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :children_diary_logs do |t|
      t.text :living
      t.text :health
      t.text :visit
      t.text :information
      t.date :date
      t.references :children, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
