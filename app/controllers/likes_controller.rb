class LikesController < ApplicationController
  def index
    @post = Post.find_by(id: likes_params)
    @likes = @post.likes
  end

  def create
    @like = Like.new(user_id: current_user.id, post_id: permitted_params)
    if !Like.already_liked?(current_user.id, permitted_params).nil?
      destroy
    elsif @like.save
      flash[:success] = "Post liked!"
      redirect_back(fallback_location: authenticated_root_path)
    else
      flash[:danger] = "It looks like something went wrong. Its us, not you. Try again!"
      redirect_back(fallback_location: authenticated_root_path)
    end
  end

  def destroy
    Like.delete_like(current_user.id, permitted_params)
    flash[:success] = "Post unliked"
    redirect_back(fallback_location: authenticated_root_path)
  end

  private

  def likes_params
    params.require(:post_id)
  end

  def permitted_params
    params.require(:post_id)
  end
  
end
