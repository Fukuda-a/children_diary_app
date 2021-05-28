class ChildrenDiariesController < ApplicationController
  def home
    @children_diary = ChildrenDiary.new
  end
  
  def show
    @children_diary = ChildrenDiary.find(params[:id])
  end

  def index
    #@children_diaries = ChildrenDiary.where(date: Time.current.all_day)
    @diaries = ChildrenDiary.search(params[:date])
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
    #@children_diary = ChildrenDiary.find(params[:children_diary][:children_id])
    if @children_diary.present?
      if @children_diary.update!(children_diary_params)
        flash[:success] = "日誌が上書きされました"
        render "children_diaries/show"
      else
        render 'children_diaries/index'
      end
    else
      @children_diary = ChildrenDiary.new(children_diary_params)
      @child = Child.find_by(id: params[:children_diary][:children_id])
      @children_diary.group_id = @child.group_id
      @children_diary.group_number = @child.group_number
      if @children_diary.save!
        flash[:success] = "記録が作成されました"
        render "children_diaries/show"
      else
        flash.now[:alert] = "日付を選択してください"
        render 'home'
      end
    end
  end
  
  def edit
     @children_diary = ChildrenDiary.find(params[:children_diary][:children_id])
  end
  
  def search
    @children_diaries = ChildrenDiary.search(params[:diary])
  end
  

  
  
  private
  
    def children_diary_params
      params.require(:children_diary).permit(:living,:health,:visit,:information, :children_id, :group_id, :date).merge(user_id: current_user.id)
    end
end
