class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  def self.pending
    Product.where(published: false)
  end

  def publish_text
    "#{url}. #{name} for $#{price}. #{description}"
  end

  def tweet_text
    text = "#{url}. #{name} for $#{price}. #{description}"
    text.tweets({delimeter: "...(more)"})
  end

  def url=(url)
    url = 'http://' + url unless url.include?('http://')
    shortened_url = self.url || $bitly.shorten(url).short_url
    super(shortened_url)
  end


end
