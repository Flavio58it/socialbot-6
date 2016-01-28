namespace :syndicate do
  desc "This task does nothing"
  task send_tweets: :environment do
    p Product.all.first
  end
end
