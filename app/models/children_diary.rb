class ChildrenDiary < ApplicationRecord
  belongs_to :children, optional: true
  validates :date, presence: true
  
  belongs_to :group
  belongs_to :user
end
