require 'croudia/object/ids'
require 'croudia/object/list'

module Croudia
  module Rest
    module Followers

      # Returns a collection of user ids that the authenticating user's followers.
      #
      # @see https://developer.croudia.com/docs/49_followers_ids
      # @return [Croudia::Object::IDs] A collection of user ids that authenticating user's followers.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the potentially followers user.
      # @option params [Integer] :user_id The ID of the potentially followers user.
      # @option params [Integer] :cursor The page cursor of collection.
      def follower_ids(params = {})
        response = get('followers/ids.json', params)
        Croudia::Object::IDs.new(response)
      end

      # Returns a collection of user objects the authenticating user's followers.
      #
      # @see https://developer.croudia.com/docs/43_followers_list
      # @return [Croudia::Object::List] A collection of user objects that authenticating user's followers.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the potentially followers user.
      # @option params [Integer] :user_id The ID of the potentially followers user.
      # @option params [Integer] :cursor The page cursor of collection.
      # @option params [Boolean] :trim_user When set to truem each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      def followers(params = {})
        response = get('followers/list.json', params)
        Croudia::Object::List.new(response)
      end
    end
  end
end
