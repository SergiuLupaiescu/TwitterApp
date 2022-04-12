# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_tweet
  before_action :find_like, only: [:destroy]

  def create
    @tweet.likes.create(user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def find_like
    @like = Like.where(user_id: current_user.id, tweet_id: @tweet.id).first
  end

end
