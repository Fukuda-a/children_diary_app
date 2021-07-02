class ChildrenDiariesController < ApplicationController
  
  def show
    @children_diary = ChildrenDiary.find(params[:id])
  end

  def index
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
      @children_diary = ChildrenDiary.new(children_diary_params)
      @child = Child.find_by(id: params[:children_diary][:children_id])
      @children_diary.group_id = @child.group_id
      @children_diary.group_number = @child.group_number
      @children_diary_logs = ChildrenDiaryLog.new(living: @children_diary.living, health: @children_diary.health,
                                                    visit: @children_diary.visit, information: @children_diary.information,
                                                    children_id: @children_diary.children_id, group_id: @children_diary.group_id,
                                                    date: @children_diary.date, user: @children_diary.user)

      if @children_diary.save
        flash[:success] = "記録が作成されました"
        @children_diary_logs.save!
        render "children_diaries/show"
          if @children_diary.information.present?
            notifier = Slack::Notifier.new(
              ENV['SLACK_WEBHOOK_URL'],
              channel: "##{ENV['SLACK_CHANNEL']}",
              username: '〇〇施設　共有連絡'
              )
              notifier.ping "新しい連絡事項があります！
                      ````
                       #{@children_diary.information}
                      ````"
            
            #Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'],"共有連絡", "#{@children_diary}")
          end
      else
        flash[:alert] = "日付を選択してください"
        if @children_diary.living.present?
          redirect_to "/living"
        elsif @children_diary.health.present?
          redirect_to "/health"
        elsif @children_diary.visit.present?
          redirect_to "/visit"
        elsif @children_diary.information.present?
          redirect_to "/information"
        end
      end
  end
  
  def edit
     @children_diary = ChildrenDiary.find(params[:id])
  end
  
  def update
    @children_diary = ChildrenDiary.find(params[:id])
    if @children_diary.update(children_diary_params)
      flash[:success] = "内容が追加・更新されました"
      redirect_to @children_diary
    else
      render 'edit'
    end
  end
  
  def search
    @children_diaries = ChildrenDiary.search(params[:diary])
  end
 
  

  
  
  private
  
    def children_diary_params
      params.require(:children_diary).permit(:living,:health,:visit,:information, :children_id, :group_id, :date).merge(user_id: current_user.id)
    end
end
