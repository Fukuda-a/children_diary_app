class AddDateToChildrenDiaries < ActiveRecord::Migration[6.0]
  def change
    add_column :children_diaries, :date, :date 
  end
end
