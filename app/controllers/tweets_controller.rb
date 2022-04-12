# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.where.not(user: current_user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
      respond_to do |format|
        format.html { redirect_to profile_url, status: 303, notice: "Tweet was successfully deleted." }
        format.json { head :no_content }
      end
  end

  def my_tweets
    @tweets = current_user.tweets
  end

  def retweet
    @retweet = Tweet.new(retweet_params)
    if @retweet.save
      redirect_to tweet_path, alert: 'Retweeted!'
    else
      redirect_to root_path, alert: 'Can not retweet'
    end
  end

  private
  def tweet_params
    params.fetch(:tweet, {}).permit(:title, :text)
  end

  def retweet_params
    params.require(:retweet).permit(:retweet_id, :content).merge(user_id: current_user.id)
  end

end
