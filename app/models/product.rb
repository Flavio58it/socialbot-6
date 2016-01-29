class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  def self.pending
    Product.where(published: false)
  end

  def self.publish
    Product.pending.each do |product|
      product.tweet_text.each do |tweet_chunk|
        $twitter.update(tweet_chunk[0..-2])
      end
      $page_graph.put_wall_post(product.publish_text)
      $tumblr.text("syndicater-jzeng.tumblr.com", title: product.name, body: product.publish_text)
      product.update(published: true)
    end
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
