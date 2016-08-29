class LikesController < ApplicationController
  def create
    like = User.find(current_user).likes.create(like_params)
    if like.valid?
      redirect_to :back
    else
      flash[:errors] = like.errors.full_messages
      redirect_to :back
    end
  end


  def destroy
    query = Like.find_by user_id: current_user.id, idea_id: like_params[:idea_id]
    query.destroy
    redirect_to :back
  end

  private
  def like_params
     params.require(:like).permit(:idea_id)
  end
end
