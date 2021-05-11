class ChildrenDiary < ApplicationRecord
  belongs_to :children, optional: true
  validates :date, presence: true
  
  belongs_to :group
  belongs_to :user
  
  
  def self.search(search)
    if search != ""
      ChildrenDiary.where(['living LIKE(?) OR health LIKE(?) OR visit LIKE(?) OR information LIKE(?)',"%#{search}%","%#{search}%","%#{search}%","%#{search}%"]).order('created_at DESC')
    else
      ChildrenDiary.none
    end
  end
end
