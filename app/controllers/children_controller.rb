class ChildrenController < ApplicationController
  
  def index
    @children = Child.where.not(group_id: "4").order(child_number: "DESC")
  end
  
  def show
    @child = Child.find(params[:id])
  end
 
  def new
    @child = Child.new
  end
  
  def create
    @child = Child.new(child_params)
    @child.group_id = @child.group_number
      if @child.save
        flash[:success] = "#{@child.name} が登録されました"
        render 'children/show'
      else
        render 'children/new'
      end
  end
  
  def edit
     @child = Child.find(params[:id])
  end
  
  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      flash[:success] = "児童情報が更新されました"
      redirect_to @child
    else
      render 'edit'
    end
  end
  
  def destroy
    Child.find(params[:id]).destroy
    flash[:success] = "削除されました"
    redirect_to children_path
  end
  
  
  private
  
   def child_params
     params.require(:child).permit(:name,:birthday,:child_centers_name,:child_number,:group_number,:group_id)
   end
  
end