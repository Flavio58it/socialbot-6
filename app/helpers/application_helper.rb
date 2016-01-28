module ApplicationHelper

  def send_tweets
    Product.pending.each do |product|
      $twitter.update(product.tweet_text)
      product.completed = true
    end
  end

end
