class ChildrenDiary < ApplicationRecord
  belongs_to :children
  belongs_to :group
  belongs_to :user
end
