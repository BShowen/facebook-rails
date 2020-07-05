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
end
