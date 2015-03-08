class RolesController < ApplicationController
  def index
    @roles = Role.all
  end
  def show
    @role = Role.find(params[:id])
  end
  def new
    @role = Role.new
  end
  def edit
    @role = Role.find(params[:id])
  end
  def create
    @role = Role.new(params.require(:role).permit(:name, :parent_id))
    if @role.save
      redirect_to @role
    else
      render 'new'
    end 
  end
  def update
    @role = Role.find(params[:id])
    if @role.update(params.require(:role).permit(:name, :parent_id))
      redirect_to @role
    else
      render 'edit'
    end
  end
  def destroy
    
  end
end
