class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true

  def self.pending
    Product.where(published: false)
  end

  def publish_text
    "#{url}. #{name} for $#{price}. #{description}"
  end

  def tweet_text
    text = "#{url}. #{name} for $#{price}. #{description}"
    text.tweets({ delimiter: "...(more)", max_length: 115 })
  end

  def url=(url)
    url = 'http://' + url unless url.include?('http://') || url.include?('https://')
    shortened_url = self.url || Publisher.new.bitly.shorten(url).short_url
    super(shortened_url)
  end


end
