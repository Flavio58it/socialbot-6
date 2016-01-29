namespace :syndicater do
  desc "This fetches syndicates new products in the database"
  task publish: :environment do
    ApplicationController.publish
  end
end
