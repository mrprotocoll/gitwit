class Tweet < ApplicationRecord
    belongs_to :user
    belongs_to :twitter_account

    validates :body, length: {minimum: 1, maximum: 280 }

    validates :published_at, presence: true

    after_initialize do
        self.published_at ||= 24.hours.from_now
    end

    after_save_commit do
        if published_at_previously_changed?
            TweetJob.set(wait_until: published_at).perform_later(self)
    end

    def published?
        tweet_id?
    end

    def publish_to_twitter!
        tweet = twitter_account.client.update(body)
        update(tweet_id: tweet.id)
    end
end
