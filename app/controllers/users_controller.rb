class UsersController < ApplicationController

  def index

  	@users = User.all
    @post = Post.new
    if user_signed_in?
    	@user == current_user
    end
  end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  	@post =Post.new
  end

  def top

  end

  def edit
    @user = User.find(params[:id])

    if @user.id == current_user.id
    else
      redirect_to user_path(@user)
    end
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  private
  def user_params
      params.require(:user).permit(:name,:image,:introduction)
  end



end
