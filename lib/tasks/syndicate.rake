namespace :syndicate do
  desc "This fetches syndicates new products in the database"
  task send_tweets: :environment do
    Product.pending.each do |product|
      $twitter.update(product.tweet_text)
      product.update(completed: true)
    end
  end
end
