require 'croudia/object/status'

module Croudia
  module Rest
    module Statuses

      # Returns a collection of the most recent Whispers, spreads and comments posted by the authenticating user and the users they non-protected.
      #
      # @see https://developer.croudia.com/docs/01_statuses_public_timeline
      # @return [Array<Croudia::Object::Status>] Collection of the most recent statuses.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      # @option params [Integer] :since_id Returns results with an ID greater than (that is, more recent than) the specified ID. 
      # @option params [Integer] :max_id Returns results with an ID less than (that is, older than) or equal to the specified ID.
      # @option params [Integer] :count Specifies the number of statuses to retrieve.
      def public_timeline(params = {})
        response = get('2/statuses/public_timeline.json', params)
        response.map{ |status| Croudia::Object::Status.new(status) }
      end

      # Returns a collection of the most recent Whispers, spreads and comments posted by the authenticating user and the users they following.
      #
      # @see https://developer.croudia.com/docs/02_statuses_home_timeline
      # @return [Array<Croudia::Object::Status>] Collection of the most recent statuses.
	    # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      # @option params [Integer] :since_id Returns results with an ID greater than (that is, more recent than) the specified ID. 
      # @option params [Integer] :max_id Returns results with an ID less than (that is, older than) or equal to the specified ID.
      # @option params [Integer] :count Specifies the number of statuses to retrieve.
      def home_timeline(params = {})
        response = get('2/statuses/home_timeline.json', params)
        response.map{ |status| Croudia::Object::Status.new(status) }
      end
      
      # Returns a collection of the most recent Whispers, spreads and comments posted by specified user.
      #
      # @see https://developer.croudia.com/docs/03_statuses_user_timeline
      # @return [Array<Croudia::Object::Status>] Collection of the most recent statuses.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the user for whom to return results for.
      # @option params [Integer] :user_id The ID of the user for whom to return results for.
      # @option params [Boolean] :trim_user When set to true, each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      # @option params [Integer] :since_id Returns results with an ID greater than (that is, more recent than) the specified ID. 
      # @option params [Integer] :max_id Returns results with an ID less than (that is, older than) or equal to the specified ID.
      # @option params [Integer] :count Specifies the number of statuses to retrieve.
      def user_timeline(params = {})
        response = get('2/statuses/user_timeline.json', params)
        response.map{ |status| Croudia::Object::Status.new(status) }
      end

      # Returns the 20 most recent mentions (Whispers containing a users’s @screen_name) for the authenticating user. 
      #
      # @see https://developer.croudia.com/docs/04_statuses_mentions
      # @return [Array<Croudia::Object::Status>] Collection of the most recent statuses.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each whisper returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      # @option params [Integer] :since_id Returns results with an ID greater than (that is, more recent than) the specified ID. 
      # @option params [Integer] :max_id Returns results with an ID less than (that is, older than) or equal to the specified ID.
      # @option params [Integer] :count Specifies the number of statuses to retrieve. 
      def mentions_timeline(params = {})
        response = get('2/statuses/mentions.json', params)
        response.map{ |status| Croudia::Object::Status.new(status) }
      end

      # Updates the authenticating user’s current status.
      #
      # @see https://developer.croudia.com/docs/11_statuses_update
      # @return [Croudia::Object::Status] Updated status.
      # @param params [Hash] A customized options.
      # @option params [String] :status The text of your status update, typically up to 372 characters.
      # @option params [Integer] :in_reply_to_status_id The ID of an existing status that the update is in reply to.
      # @option params [Integer] :timer Whispers timer's seconds.
      # @option params [Boolean] :trim_user When set to true, the whisper returned will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def update_status(params = {})
        response = post('2/statuses/update.json', params)
        Croudia::Object::Status.new(response)
      end

      # Updates the authenticating user's current status with media as photos.
      #
      # @see https://developer.croudia.com/docs/14_statuses_update_with_media
      # @return [Croudia::Object::Status] Updated status.
      # @param params [Hash] A customized options.
      # @option params [String] :status The text of your status update, typically up to 372 characters.
      # @option params [File] :media Attachment image that PNG, JPEG or GIF format.
      # @option params [Integer] :in_reply_to_status_id The ID of an existing status that the update is in reply to.
      # @option params [Integer] :timer Whispers timer's seconds.
      # @option params [Boolean] :trim_user When set to true, the whisper returned will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.      
      def update_status_with_media(params = {})
        response = post('2/statuses/update_with_media.json', params)
        Croudia::Object::Status.new(response)
      end

      # Deletes the authenticating user's status.
      #
      # @see https://developer.croudia.com/docs/12_statuses_destroy
      # @return [Croudia::Object::Status] Deleted status.
      # @param status [Croudia::Object::Status] Delete status.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, whisper returned will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def delete_status(status, params = {})
        response = post("2/statuses/destory/#{status.id}.json", params)
        Croudia::Object::Status.new(response)
      end
      alias_method :delete_spread, :delete_status

      # Returns a single Whisper, specified by the id parameter.
      #
      # @see https://developer.croudia.com/docs/13_statuses_show
      # @return [Croudia::Object::Status] Status specified by id.
      # @param status [Croudia::Object::Status] Status.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, whisper returned will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def status(status, params = {})
        response = get("2/statuses/show/#{status.id}.json", params)
        Croudia::Object::Status.new(response)
      end

      # Shares the status by authenticating user.
      #
      # @see https://developer.croudia.com/docs/61_statuses_spread
      # @return [Croudia::Object::Status] Status shread by id.
      # @param status [Croudia::Object::Status] Status.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, whisper returned will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def spread(status, params = {})
        response = post("2/statuses/spread/#{status.id}.json", params)
        Croudia::Object::Status.new(response)
      end

      #
      # 
      # @see https://developer.croudia.com/docs/112_statuses_comment
      # @return [Croudia::Object::Status] Commented status.
      # @param params [Hash] A customized options.
      # @option params [Integer] :id Comment status id.
      # @option params [String] :status Comment body.
      # @option params [Boolean] :trim_user When set to true, whisper returned will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def comment(params = {})
        response = post('2/statuses/comment.json', params)
        Croudia::Object::Status.new(response)
      end

      # 
      #
      # @see https://developer.croudia.com/docs/113_statuses_comment_with_media
      # @return [Croudia::Object::Status] Commented status.
      # @param params [Hash] A customized options.
      # @option params [Integer] :id Comment status id.
      # @option params [String] :status Comment body.
      # @option params [File] :media Attachment media.
      # @option params [Boolean] :trim_user When set to true, whisper returned will include a user object including only the status authors numerical ID.
      # @option params [Boolean] :include_entities The entities node will be omitted when set to false.
      def comment_with_media(params = {})
        response = post('2/statuses/comment_with_media.json', params)
        Croudia::Object::Status.new(response)
      end
    end
  end
end
