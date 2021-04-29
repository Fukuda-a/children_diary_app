class ChildrenDiariesController < ApplicationController
  def index
    @children_diary = ChildrenDiary.new
  end
  
  def show
  end
  
  def living
    @children = Child.all
    @children_diary = ChildrenDiary.new
  end
  
  def new
    @children_diary = ChildrenDiary.new
  end
  
  def create
    @children_diary = ChildrenDiary.find_by(children_id: params[:children_diary][:children_id])
    if @children_diary.present?
      # 更新処理
      if @children_diary.update!(children_diary_params)
        flash[:success] = "記録が更新されました"
        redirect_to "/living"
      else
        render'children_diaries/index'
      end
    else
      # 新規作成処理
      @children_diary = ChildrenDiary.new(children_diary_params)
      if @children_diary.save!
        flash[:success] = "記録が作成されました"
        redirect_to "/living"
      else
        render'children_diaries/index'
      end
    end
  end
  
  
  private
  
    def children_diary_params
      params.require(:children_diary).permit(:living,:health,:visit,:information, :children_id, :group_id).merge(user_id: current_user.id)
    end
end
