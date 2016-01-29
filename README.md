# SocialBot
[Live](http://syndicater-jzeng.herokuapp.com)

Automated way to publish product information to various social media sources.


## Features
* Allows users to create products with a name, price, description, and url
* Must login to create products or publish
* Shortens urls using bitly API
* Breaks long messages into multiple tweets
* Publish posts information about product to a predefined Facebook page, Twitter
account, Tumblr blog via API
* Keeps track of published and unpublished products. Will only publish products
that have not been published yet
* Rake task to automate publishing at set intervals if desired



## Pages published to
* [Twitter account](https://twitter.com/jamesmoney12312)
* [Facebook page](https://www.facebook.com/syndicaterjzeng123)
* [Tumblr blog](http://syndicater-jzeng.tumblr.com)

## Assumptions
* Assume that posts are made from one main social media account for each site which can be hard coded.
* Assume we want to hang on to products in the database for a certain amount of time.
We can run a rake task to delete old products if necessary.

# Resources
* [Permanent access token for FB page](http://stackoverflow.com/questions/17197970/facebook-permanent-page-access-token)
