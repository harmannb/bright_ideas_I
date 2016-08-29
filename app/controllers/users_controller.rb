class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
    @liked_posts = User.find(params[:id]).liked_ideas.all
    @ideas = User.find(params[:id]).ideas.all
  end


  private
  def user_params
     params.require(:user).permit(:email, :name, :alias, :password, :password_confirmation)
  end

end
