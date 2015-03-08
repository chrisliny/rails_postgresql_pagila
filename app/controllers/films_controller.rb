class FilmsController < ApplicationController
  helper_method :sortcolumn, :sortdirection
  def index
    @films = Film.search(params[:search]).order(sortcolumn + " " + sortdirection).page params[:page]
  end
  def show
    @categories = Category.all
    @film = Film.find(params[:id])
    @actors = @film.actors
  end
  
  private
  
  def sortcolumn
    params[:sort] ||= 'title'    
  end
  def sortdirection
    params[:direction] ||= 'desc'    
  end
end
