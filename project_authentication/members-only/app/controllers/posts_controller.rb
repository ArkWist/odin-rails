class PostsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  
  def new
    @post = Post.new
  end

  def create
    user_id = current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path  
  end
  
  def index
    @posts = Post.all
  end
  
  private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
  
end
