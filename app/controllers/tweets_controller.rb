class TweetsController < ApplicationController
  before_action :require_login!
  before_action :set_tweet, only: %i[edit update destroy]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet Scheduled successfully'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: 'Scheduled tweet updated successfully'
    else
      render :edit
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to tweets_path, notice: 'Tweet unscheduled successfully'
    else
      redirect_to request.referrer
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :published_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end
end
