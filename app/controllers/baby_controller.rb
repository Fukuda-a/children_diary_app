class BabyController < ApplicationController
  def living
    @child = Child.find_by(name: "田中　花子") 
    @children_diary = ChildrenDiary.new
  end
  
  def health
    @child = Child.where(group_number: "1")
  end
  
  def visit
    @child = Child.where(group_number: "1")
  end

  def information
    @child = Child.where(group_number: "1")
  end
end


