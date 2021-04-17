class ChildrenController < ApplicationController
  
  def show
   @child = Child.find(params[:id])
  end
 
  def new
    @child = Child.new
  end
  
end