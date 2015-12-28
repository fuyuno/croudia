require 'croudia/object/ids'
require 'croudia/object/list'

module Croudia
  module Rest
    module Friends

      # Returns a collection of user ids that the authenticating user's friends.
      #
      # @see https://developer.croudia.com/docs/49_friends_ids
      # @return [Croudia::Object::IDs] A collection of user ids that authenticating user's friends.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the potentially friends user.
      # @option params [Integer] :user_id The ID of the potentially friends user.
      # @option params [Integer] :cursor The page cursor of collection.
      def friend_ids(params = {})
        response = get('friends/ids.json', params)
        Croudia::Object::IDs.new(response)
      end

      # Returns a collection of user objects the authenticating user's friends.
      #
      # @see https://developer.croudia.com/docs/43_friends_list
      # @return [Croudia::Object::List] A collection of user objects that authenticating user's friends.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the potentially friends user.
      # @option params [Integer] :user_id The ID of the potentially friends user.
      # @option params [Integer] :cursor The page cursor of collection.
      # @option params [Boolean] :trim_user When set to truem each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      def friends(params = {})
        response = get('friends/list.json', params)
        Croudia::Object::List.new(response)
      end
    end
  end
end
