class FriendRequestsController < ApplicationController
  def index
    @friend_requests_received = current_user.friend_requests_received
    @friend_requests_sent = current_user.friend_requests_sent
  end
  
  def create
    # create a new FriendRequest tuple
    friend_request = current_user.friend_requests_sent.build(receiver_id: request_params)

    # try to save the tuple
    if friend_request.save
      flash[:success] = "Friend request has been sent."
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def destroy
    friend_request = FriendRequest.where("sender_id = ? AND receiver_id = ?", current_user.id, request_params).take
    if friend_request.destroy 
      flash[:notice] = "Friend request cancelled"
      redirect_to friend_requests_path
    else
      flash[:notice] = "Something went wrong"
      redirect_to authenticated_root
    end
  end

  private
  def request_params
    params.require(:id)
  end
end
