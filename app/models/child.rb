class Child < ApplicationRecord
  has_many :children_diaries,foreign_key: :children_id,dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :child_centers_name, presence: true
  validates :child_number, presence: true
end
