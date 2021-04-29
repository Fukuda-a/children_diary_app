class ChildrenDiariesController < ApplicationController
  def index
    @children_diary = ChildrenDiary.new
  end
  
  def show
  end
  
  def living
    @children = Child.all
  end
  
  def new
    @children_diary = ChildrenDiary.new
  end
  
  def create
    @children_diary = ChildrenDiary.new
    if @children_diary.save
        flash[:success] = "記録されました"
    else
        render'children_diaries/index'
    end
  end
  
  
  private
  
    def children_diary_params
      params.permit(:living,:health,:visit,:information)
    end
end
