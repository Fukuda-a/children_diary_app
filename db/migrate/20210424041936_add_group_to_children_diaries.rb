class AddGroupToChildrenDiaries < ActiveRecord::Migration[6.0]
  def change
    add_column :children_diaries, :group_number, :integer
  end
end
