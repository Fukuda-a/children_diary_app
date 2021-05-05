class AddGroupToChildren < ActiveRecord::Migration[6.0]
  def change
    add_column :children, :group_number, :integer
  end
end
