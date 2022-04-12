# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :find_tweet, only: [:create]

  def create
    @tweet.comments.create(user_id: current_user.id, text: params[:text])
    redirect_back(fallback_location: root_path)
  end

  def edit
    @comment
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to "/users/#{@comment.user.id}", notice: "Tweet was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def find_comment
    @comment = find_tweet.comments.find(params[:id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(:text)
  end

end
