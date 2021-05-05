class AddGroupIdToChildren < ActiveRecord::Migration[6.0]
  def change
    add_reference :children, :group, foreign_key: true
  end
end
