require 'croudia/object/tokens'

module Croudia
  module Rest
    module OAuth
      # Allows a registered application to obtain an OAuth 2 Bearer Token.
      #
      # @see https://developer.croudia.com/docs/oauth
      # @return [Croudia::Object::Tokens] Token pair.
      # @param params [Hash] A customized options.
      # @option params [String] :code Authorization code of application.
      def token(params = {})
        default_params = {grant_type: 'authorization_code', client_id: @client_id, client_secret: @client_secret}
        params.merge!(default_params)
        response = post('oauth/token', params)
        puts response
        Croudia::Object::Tokens.new(response)
      end

      # Refresh an OAuth 2 Bearer Token.
      #
      # @see https://developer.croudia.com/docs/oauth
      # @return [Croudia::Object::Tokens] Token pair.
      # @param params [Hash] A customized options.
      # @option params [String] :refresh_token OAuth 2 refresh token.
      def refresh(params = {})
        default_params = {grant_type: 'refresh_token', client_id: @client_id, client_secret: @client_secret }
        params.merge!(default_params)
        response = post('oauth/token', params)
        Croudia::Object::Tokens.new(response)
      end
    end
  end
end
