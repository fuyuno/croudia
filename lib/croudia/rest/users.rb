require 'croudia/object/user'

module Croudia
  module Rest
    module Users
      
      # Returns a variety of information about the user.
      #
      # @see https://developer.croudia.com/docs/31_users_show
      # @return [Croudia::Object::User] Variety of information about the user.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the user for whom to return results for.
      # @option params [Integer] :user_id The ID of the user for whom to return results for.
      def user(params = {})
        response = get('users/show.json', params)
        Croudia::Object::User.new(response)
      end


      # Returns a information about the up to 100 users.
      #
      # @see https://developer.croudia.com/docs/32_users_lookup
      # @return [Array<Croudia::Object::User>] Information about the users.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The camma-separated screen name of the user for whom to return results for.
      # @option params [Integer] :user_id The camma-separated IDs of the user for whom to return results for.
      def users(params = {})
        response = get('users/lookup.json', params)
        response.map {|user| Croudia::Object::User.new(user) }
      end
    end
  end
end
