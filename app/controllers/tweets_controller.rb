class TweetsController < ApplicationController
  before_action :set_tweets, only: [ :index, :create ]

  def index
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to tweets_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
    def set_tweets
      @tweets = Tweet.all.order(created_at: :desc)
    end

    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
