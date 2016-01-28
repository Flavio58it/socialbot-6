class Product < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  validates :name, presence: true
  validates :price, presence: true
  # validates :url, format: { with: /\A(https?:\/\/)?([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})([\/\w\.-]*)*\/?\z/, message: "Use http://www.yoururl.com" }

  def self.pending
    Product.where(completed: false)
  end

  def tweet_text
    text = "#{url}. See #{name} for $#{price}. #{description}"
    text.truncate(140)
  end

  def url=(url)
    url = 'http://' + url unless url.include?('http://')
    shortened_url = $bitly.shorten(url).short_url
    super(shortened_url)
  end


end
