require 'json'

require 'typhoeus'

require 'croudia/error'
require 'croudia/rest/account'
require 'croudia/rest/blocks'
require 'croudia/rest/favorites'
require 'croudia/rest/followers'
require 'croudia/rest/friend_ships'
require 'croudia/rest/friends'
require 'croudia/rest/mutes'
require 'croudia/rest/oauth'
require 'croudia/rest/search'
require 'croudia/rest/secret_mails'
require 'croudia/rest/statuses'
require 'croudia/rest/trends'
require 'croudia/rest/users'

module Croudia
  class Client

    include Croudia::Rest::Account
    include Croudia::Rest::Blocks
    include Croudia::Rest::Favorites
    include Croudia::Rest::Followers
    include Croudia::Rest::FriendShips
    include Croudia::Rest::Friends
    include Croudia::Rest::Mutes
    include Croudia::Rest::OAuth
    include Croudia::Rest::Search
    include Croudia::Rest::SecretMails
    include Croudia::Rest::Statuses
    include Croudia::Rest::Trends
    include Croudia::Rest::Users

    # Initializes a new Client object
    # 
    # @param options [Hash]
    # @return [Croudia::Client]
    def initialize(params = {})
      params.each do |key, value|
        instance_variable_set("@#{key}", value)
      end   
    end

    # Updates access token.
    #
    # @param access_token [String] Access token.
    def update_access_token!(access_token)
      @access_token = access_token
    end

    def get(endpoint, params = {})
      request = Typhoeus::Request.new(
        "https://api.croudia.com/#{endpoint}",
        method: :get,
        params: params,
        headers: {Authorization: "Bearer #{@access_token}"}
      )
      request.run
      response = request.response
        
      if(response.code != 200)
        raise Croudia::Error.from_response(response)
      end
      JSON.parse(response.body)
    end

    def post(endpoint, params = {})
      request = Typhoeus::Request.new(
        "https://api.croudia.com/#{endpoint}",
        method: :post,
        body: params,
        headers: {Authorization: "Bearer #{@access_token}"}
      )
      request.run
      response = request.response

      if(response.code != 200)
        raise Croudia::Error.from_response(response)
      end
      JSON.parse(response.body)
    end
  end
end
