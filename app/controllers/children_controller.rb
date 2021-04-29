class ChildrenController < ApplicationController
  
  def index
    @children = Child.all 
    #@child = Children.find(params[:id])
  end
  
  def show
    @child = Child.find(params[:id])
  end
 
  def new
    @child = Child.new
  end
  
  def create
    @child = Child.new(child_params)
      if @child.save
        flash[:success] = "#{@child.name} が登録されました"
        render 'children/show'
      else
        render 'children/new'
      end
  end
  
  def destroy
    Child.find(params[:id]).destroy
    flash[:success] = "削除されました"
    redirect_to children_path
  end
  
  
  private
  
   def child_params
     params.require(:child).permit(:name,:birthday,:child_centers_name,:child_number)
   end
  
end