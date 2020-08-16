class StaticPagesController < ApplicationController
  def index
    @users = User.all
    @post = Post.new
    @feed = current_user.feed
  end
end
