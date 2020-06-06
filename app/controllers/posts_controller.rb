class PostsController < ApplicationController
  def index
    # retrieve all the posts that have a foreign key belonging to current_user
    @posts = current_user.posts
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
  end

  def show
  end
end
