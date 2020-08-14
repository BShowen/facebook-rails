class LikesController < ApplicationController
  def index
    @post = Post.find_by(id: likes_params)
    @likes = @post.likes
  end

  def create
    byebug
  end

  def new
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def show
  end

  private

  def likes_params
    params.require(:post_id)
  end
end
