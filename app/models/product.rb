class Product < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  def self.pending
    Product.where(completed: false)
  end

  def tweet_text
    text = "#{name} at the price of #{price}. #{description}"
    text.truncate(140)
  end


end
