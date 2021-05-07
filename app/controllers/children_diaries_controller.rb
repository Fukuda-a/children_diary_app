class ChildrenDiariesController < ApplicationController
  def home
    @children_diary = ChildrenDiary.new
  end

  def index
    @children = Child.all
    @children_diaries = ChildrenDiary.all
  end
  
  def destroy
    ChildrenDiary.find(params[:id]).destroy
    flash[:success] = "削除されました"
    redirect_to children_diaries_path, method: :get
  end
  
  def living
    @children = Child.all
    @children_diary = ChildrenDiary.new
  end
  
  def health
    @children = Child.all
    @children_diary = ChildrenDiary.new
  end
  
  def visit
    @children = Child.all
    @children_diary = ChildrenDiary.new
  end
  
  def information
    @children = Child.all
    @children_diary = ChildrenDiary.new
  end
  
  def new
    @children_diary = ChildrenDiary.new
  end
  
  def create
      @children_diary = ChildrenDiary.new(children_diary_params)
      @child = Child.find_by(id: params[:children_diary][:children_id])
      @children_diary.group_id = @child.group_id
      @children_diary.group_number = @child.group_number
      @children_diary_logs = ChildrenDiaryLog.new(living: @children_diary.living,health: @children_diary.health,
                                                    visit: @children_diary.visit,information: @children_diary.information,
                                                    children_id: @children_diary.children_id,group_id: @children_diary.group_id,
                                                    date: @children_diary.date,user: @children_diary.user)
      if @children_diary.save!
        flash[:success] = "記録が作成されました"
        @children_diary_logs.save!
        redirect_to "/home"
      else
        flash.now[:alert] = "日付を選択してください"
        render 'home'
      end 
  end
  

  
  
  private
  
    def children_diary_params
      params.require(:children_diary).permit(:living,:health,:visit,:information, :children_id, :group_id, :date).merge(user_id: current_user.id)
    end
end
