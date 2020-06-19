class FriendshipsController < ApplicationController
  # when a user accepts a friend request we create a tuple in the FriendShips relation. We need to go in the FriendRequests relation and remove the actual request. Otherwise the user will be friends with the other user and still have the old friend request. 
  

  # create a new friendship between the current_user and friend requestor.
  def create
    @friend_requestor = User.find_by(id: friend_params)
    friendship = current_user.friendships.build(friend_id: @friend_requestor.id)

    if friendship.save
      flash[:notice] = "You are now friends with #{@friend_requestor.name}"

      # remove the old friend request from the FriendRequests relation because the users now have a Friendship.
      remove_friend_request

      #redirect back to the friend requests page.
      redirect_to friend_requests_path
    else
      flash[:notice] = "Something went wrong"

      # redirect to the root path.
      redirect_to authenticated_root_path
    end
  end

  def destroy
    friend = User.find_by(id: friend_params)
    friendship = Friendship.where("user_id = ? AND friend_id = ?", current_user.id, friend.id).take || 
                          Friendship.where("user_id = ? AND friend_id = ?", friend.id, current_user.id).take
    if friendship.destroy
      flash[:notice] = "You are no longer friends with #{friend.name}"
      redirect_to friendships_path
    else
      flash[:notice] = "Something went wrong"
      redirect_to authenticated_root_path
    end
  end

  def index
    @friends = current_user.friends
  end

  private
  # retreive the sender_id for the friend request. 
  def friend_params
    params.require(:id)
  end

  # remove the old friend request after creating the friendship. 
  def remove_friend_request
    friend_request = current_user.friend_requests_received.where("sender_id = ?", @friend_requestor.id).take
    friend_request.destroy
  end
end
