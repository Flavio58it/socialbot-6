namespace :syndicater do
  desc "This publishes pending products in the database"
  task publish: :environment do
    ApplicationController.publish
  end
end
