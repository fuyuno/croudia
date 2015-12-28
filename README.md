# Croudia

[Croudia](https://croudia.com) API wrapper gem.  
You use as [twitter gem](https://github.com/sferik/twitter).

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'croudia'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install croudia

## Usage

Configuring client...

```ruby
client = Croudia::Client.new({client_id: 'YOUR_CLIENT_ID', client_secret: 'YOUR_CLIENT_SECRET'})
```

and authorize.

```ruby
cleint.authorize_url
# => https://api.croudia.com/oauth/authorize?response_type=code&client_id=YOUR_CLIENT_ID

token = client.token({code: 'AUTHORIZATION_CODE'})
client = Croudia::Client.new({client_id: 'YOUR_CLIENT_ID', client_secret: 'YOUR_CLIENT_SECRET', access_token: token.access_token})
```
#### Authorization user profile.
```ruby
user = client.verify_credentials
user.screen_name
# => MikazukiFuyuno
```

#### Updating status.
```ruby
status = client.update_status(status: 'Hello, world')
status.text
# => Hello, world
```

#### Get timeline.
##### public timeline
```ruby
client.public_timeline.each do |status|
	puts status.text
end
```

##### mentions
```ruby
client.mentions_timeline.each do |status|
	puts status.text
end
```

#### Follow user.
```ruby
client.follow(screen_name: 'MikazukiFuyuno')
client.follow(user_id: 43391)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fuyuno/croudia.

