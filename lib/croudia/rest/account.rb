require 'croudia/object/user'

module Croudia
  module Rest
    module Account
      
      # Returns an HTTP 200 OK response code and a representation of the requesting user if 
      # authentication was successful; returns a 401 status code and an error message if not. 
      # Use this method to test if supplied user credentials are valid.
      #
      # @see https://developer.croudia.com/docs/35_account_verify_credentials
      # @return [Croudia::Object::User] Authenticated user
      def verify_credentials
        response = get('account/verify_credentials.json')
        Croudia::Object::User.new(response)
      end

      # Updates the authenticating user’s profile image.
      #
      # @see https://developer.croudia.com/docs/36_account_update_profile_image
      # @return [Croudia::Object::User] Authenticated user
      # @param params [Hash] A customized options.
      # @option params [File] :image Profile image
      def update_profile_image(params = {})
        response = post('account/update_profile_image.json', params)
        Croudia::Object::User.new(response)
      end

      # Updates the authenticating user's cover image.
      #
      # @see https://developer.croudia.com/docs/39_account_update_cover_image
      # @return [Croudia::Object::User] Authenticated user
      # @param params [Hash] A customized options.
      # @option params [File] :image Cover image
      def update_cover_image(params = {})
        response = post('account/update_cover_image.json', params)
        Croudia::Object::User.new(response)
      end

      # Updates the authenticating user's profile.
      #
      # @see https://developer.croudia.com/docs/37_account_update_profile
      # @return [Croudia::Object::User] Authenticated user
      # @param params [Hash] A customized options.
      # @option params [String] :name Name
      # @option params [String] :url Homepage url
      # @option params [String] :location Location
      # @option params [String] :description Bio
      # @option params [Integer] :timersec Whisper Timer's time (seconds).
      # @option params [Boolean] :protected Whispers published to the world (true) or followers only (false).
      def update_profile(params = {})
        response = post('account/update_profile.json', params)
        Croudia::Object::User.new(response)
      end
    end
  end
end
