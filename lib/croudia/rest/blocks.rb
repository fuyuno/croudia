require 'croudia/object/ids'
require 'croudia/object/list'
require 'croudia/object/user'

module Croudia
  module Rest
    module Blocks

      # Blocks the specified user from following the authenticating user.
      #
      # @see https://developer.croudia.com/docs/120_blocks_create
      # @return [Croudia::Object::User] Blocked user
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the potentially blocked user.
      # @option params [Integer] :user_id The ID of the potentially blocked user.
      def block(params = {})
        response = post('blocks/create.json', params)
        Croudia::Object::User.new(response)
      end

      # Un-blocks the user specified in the ID parameter for the authenticating user.
      #
      # @see https://developer.croudia.com/docs/121_blocks_destroy
      # @return [Croudia::Object::User] Un-blocked user.
      # @param params [Hash] A customized options.
      # @option params [String] :screen The screen name of the potentially un-blocked user.
      # @option params [Integer] :user_id The ID of the potentially un-blocked user.
      def unblock(params = {})
        response = post('blocks/destroy.json', params)
        Croudia::Object::User.new(response)
      end

      # Returns a collection of user objects that the authenticating user is blocking.
      #
      # @see https://developer.croudia.com/docs/122_blocks_list
      # @return [Croudia::Object::List] A collection of users that the authenticating user is blocking.
      # @param params [Hash] A customized options.
      # @option params [Integer] :cursor The page cursor of collection.
      def blocks(params = {})
        response = get('blocks/list.json', params)
        Croudia::Object::List.new(response)
      end

      # Returns a collection of user ids that the authenticating user is blocking.
      #
      # @see https://developer.croudia.com/docs/123_blocks_ids
      # @return [Croudia::Object::IDs] A collection of ids that the authenticating user is blocking.
      # @param params [Hash] A customized options.
      # @option params [Integer] :cursor The page cursor of collection.
      def block_ids(params = {})
        response = get('blocks/ids.json', params)
        Croudia::Object::IDs.new(response)
      end
    end
  end
end
