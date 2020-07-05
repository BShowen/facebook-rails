class StaticPagesController < ApplicationController
  def index
    @users = User.all
    @post = Post.new
  end
end
