class FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.all
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Successfully added friend."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully removed friend."
    redirect_to root_url
  end
end