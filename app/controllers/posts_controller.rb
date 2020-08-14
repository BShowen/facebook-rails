class PostsController < ApplicationController
  def index
    # retrieve all the posts that have a foreign key belonging to current_user
    @posts = current_user.posts
  end

  def edit
  end

  def update
  end

  def destroy
    # Delete the post is params: :id only if the current user is the author of the post. 
    post = Post.find_by(id: destroy_params)
    if post.author == current_user
      post.destroy!
      flash[:success] = "Post deleted"
      redirect_to posts_path
    else
      flash[:danger] = "Something went wrong"
      redirect_to authenticated_root_path
    end
  end

  def create
    post = current_user.posts.build post_params

    if post.valid?
      post.save!
      flash[:success] = "New post created!"
      redirect_to authenticated_root_path
    else
      flash[:warning] = ""
      post.errors.full_messages.each do |error_message|
        flash[:warning] += "#{error_message}. "
      end
      redirect_to authenticated_root_path
    end
  end

  def show
  end

  private
  def post_params 
    params.require(:post).permit(:title, :body)
  end

  def destroy_params
    params.require(:id)
  end
end
