class PostController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  
  
  def new
    @post = Post.new
  end

  def create
  end
end
