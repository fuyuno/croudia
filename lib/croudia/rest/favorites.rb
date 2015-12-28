require 'croudia/object/status'

module Croudia
  module Rest
    module Favorites

      # **This method must throw Exception.**
      # Returns the 20 most recent Whispers favorited by the authenticating or specified user.
      #
      # @see https://developer.croudia.com/docs/51_favorites
      # @return [NotImplementedError]
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      def favorites(params = {})
        raise NotImplementedError.new()
      end

      # Favorites the status specified in the ID parameter as the authenticating user. 
      # Returns the favorited status when successful.
      #
      # @see https://developer.croudia.com/docs/52_favorites_create
      # @return [Croudia::Object::Status] Favorited status.
      # @param status [Croudia::Object::Status] The favorite whisper.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def favorite(status, params = {})
        response = post("2/favorites/create/#{status.id}.json", params)
        Croudia::Object::Status.new(response)
      end

      # Un-favorites the status specified in the ID parameter as the authenticating user.
      # Returns the un-favorited status when successful.
      #
      # @see https://developer.croudia.com/docs/53_favorites_destroy
      # @return [Croudia::Object::Status] Un-favorited status.
      # @param status [Croudia::Object::Status] The un-favorite whisper.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def unfavorite(status, params = {})
        response = post("2/favorites/destory/#{status.id}.json", params)
        Croudia::Object::Status.new(response)
      end
    end
  end
end
