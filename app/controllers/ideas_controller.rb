class IdeasController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @idea = Idea.all
  end

  def new
  end

  def create
    @idea = User.find(current_user).ideas.create(idea_params)
    if @idea.valid?
      redirect_to :back
    else
      flash[:errors] = idea.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @likes = Idea.find(params[:id]).likes.all
  end

  def destroy
    Idea.find(params[:id]).delete
    redirect_to :back
  end

  private
  def idea_params
     params.require(:idea).permit(:idea)
  end
end
