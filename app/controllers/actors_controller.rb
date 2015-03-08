class ActorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @actors = Actor.all
  end
  def show
    @actor = Actor.find(params[:id])
    @films = @actor.films
  end
end
