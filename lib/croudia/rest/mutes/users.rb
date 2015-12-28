require 'croudia/object/user'
require 'croudia/object/ids'
require 'croudia/object/list'

module Croudia
  module Rest
    module Mutes
      module Users
        
        # Mutes the user specified in the ID parameter for the authenticating user.
        #
        # @see https://developer.croudia.com/docs/71_mutes_users_create
        # @return [Croudia::Object::User] Muted user.
        # @param params [Hash] A customized options.
        # @option params [String] :screen_name The screen name of the potentially muted user.
        # @option params [Integer] :user_id The ID of the potentially muted user.
        def mute(params = {})
          response = post('mutes/users/create.json', params)
          Croudia::Object::User.new(response)
        end

        # Un-mutes the user specified in the ID parameter for the authenticating user.
        #
        # @see https://developer.croudia.com/docs/72_mutes_users_destroy
        # @return [Croudia::Object::User] Un-muted user.
        # @param params [Hash] A customized options.
        # @option params [String] :screen_name The screen name of the potentially unmuted user.
        # @option params [Integer] :user_id The ID of the potentially unmuted user.
        def umnute(params = {})
          response = post('mutes/users/destroy.json', params)
          Croudia::Object::User.new(response)
        end

        # Returns a collection of users the authenticating user has muted.
        #
        # @see https://developer.croudia.com/docs/74_mutes_users_list
        # @param params [Hash] A customized options.
        # @option params [Integer] :cursor The page cursor.
        # @option params [Boolean] :trim_user When set to true, objects returned will include a user object including only the status authors numerical ID.
        def mutes(params = {})
          response = get('mutes/users/list.json', params)
          Croudia::Object::List.new(response)
        end

        # Returns an array of numeric user ids the authenticating user has muted.
        #
        # @see https://developer.croudia.com/docs/75_mutes_users_ids
        # @return [Croudia::Object::IDs] Numeric user ids the authenticating user has muted.
        # @param params [Hash] A customized options.
        # @option params [Integer] :cursor The page cursor.
        def mute_ids(params = {})
          response = get('mutes/users/ids.json', params)
          Croudia::Object::IDs.new(response)
        end
      end
    end
  end
end
