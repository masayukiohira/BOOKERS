class PostsController < ApplicationController
  before_action :authenticate_user!, :except=>[:about]

  def about

  end

  def index
     @post = Post.new
     @posts = Post.all
  end

  def show
  	  @postf = Post.find(params[:id])
      @post = Post.new
  end

  def new
      @post = Post.new
  end

  def create
  	  @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
  	    redirect_to post_path(@post)
      else
        @posts = Post.all
        render 'index'
      end
  end

  def edit
      @post = Post.find(params[:id])

      if @post.user.id == current_user.id
      
      else
        redirect_to posts_path
      end
  end

  def update
  	  @post = Post.find(params[:id])
  	  @post.update(post_params)
      #flash[:success] = "Book was successfully updated."
  	  redirect_to post_path(@post.id)
  end

  def destroy
  	  post = Post.find(params[:id])
  	  post.destroy
      #flash[:success] = "Book was successfully destroyed."
  	  redirect_to posts_path
  end

  private
  def post_params
      params.require(:post).permit(:title, :body, :image)
  end
end
