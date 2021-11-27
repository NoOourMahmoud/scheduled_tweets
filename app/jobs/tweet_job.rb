class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet) 
    #####DEbuging
    #binding.irb   #the type it in console "TweetJob.perform_now(Tweet.last)"
    #  Reschedule tweets to earlier time
    return if tweet.published?

    # Reschedule tweets to the future
    return if tweet.publish_at > Time.current

    #do the publish
    tweet.publish_to_twitter!
  end
end
