class UsersController < ApplicationController

  def index
    if params[:query].present?
      @users = User.where("email like ?", "%#{params[:query]}%")
    end
  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: params[:id])
  end

end
