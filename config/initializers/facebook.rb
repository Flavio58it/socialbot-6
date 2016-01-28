user_graph = Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])
pages = user_graph.get_connections('me', 'accounts')
page_token = pages.first['access_token']
$page_graph = Koala::Facebook::API.new(page_token)
