# SocialBot
[Live](http://www.socialbot.xyz)

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
* Rake task (lib/tasks/scheduler.rake) to automate publishing at set intervals using Heroku scheduler.

## Pages published to
* [Twitter account](https://twitter.com/jamesmoney12312)
* [Facebook page](https://www.facebook.com/syndicaterjzeng123)
* [Tumblr blog](http://syndicater-jzeng.tumblr.com)

## Assumptions
* Assume that posts are made from one main social media account for each site which can be hard coded.
* Assume we want to hang on to products in the database for a certain amount of time. We can periodically run a rake task to delete old products if necessary.

## Known bugs
* The twitter API converts any links in the twitter text to t.co links. According to their faq 't.co' links represent a variant character count around 22 characters, thus making it difficult to determine what text is valid to submit through the API and where to break the text. I have chosen to restrict my tweet text to 115 characters to avoid going over 140 characters after Twitter has converted my link into t.co.
* Product text that's too long will get truncated on twitter. It seems like you can only send 8 tweets in a row in a short interval.

# Resources
* [Permanent access token for FB page](http://stackoverflow.com/questions/17197970/facebook-permanent-page-access-token)
* [See section on 'How do I count out 140 characters'](https://dev.twitter.com/faq)
