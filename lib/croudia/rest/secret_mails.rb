require 'croudia/object/secret_mail'

module Croudia
  module Rest
    module SecretMails
    
      # Returns the 20 most recent direct messages sent to the authenticating user.
      #
      # @see https://developer.croudia.com/docs/21_secret_mails
      # @return [Array<Croudia::Object::SecretMail>] Secret mails that authenticating user is received.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each message returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Integer] :since_id Returns results with an ID greater than (that is, more recent than) the specified ID. 
      # @option params [Integer] :max_id Returns results with an ID less than (that is, older than) or equal to the specified ID.
      # @option params [Integer] :count Specifies the number of statuses to retrieve.
      def received(params = {})
        response = get('secret_mails.json', params)
        response.map do |sm|
          Croudia::Object::SecretMail.new(sm)
        end
      end

      # Returns the 20 most recent direct messages sent by the authenticating user.
      #
      # @see https://developer.croudia.com/docs/22_secret_mails_sent
      # @return [Array<Croudia::Object::SecretMail>] Secret mails that authenticating user is sent.
      # @param params [Hash] A customized options.
      # @option params [Boolean] :trim_user When set to true, each message returned in a timeline will include a user object including only the status authors numerical ID.
      # @option params [Integer] :since_id Returns results with an ID greater than (that is, more recent than) the specified ID. 
      # @option params [Integer] :max_id Returns results with an ID less than (that is, older than) or equal to the specified ID.
      # @option params [Integer] :count Specifies the number of statuses to retrieve.    
      def sent(params = {})
        response = get('secret_mails/sent.json', params)
        response.map do |sm|
          Croudia::Object::SecretMail.new(sm)
        end
      end

      # Sends a new message to the specified user from the authenticating user. 
      # 
      # @see https://developer.croudia.com/docs/23_secret_mails_new
      # @return [Croudia::Object::SecretMail] Sent message.
      # @param params [Hash] A customized options.
      # @option params [String] :text The text of your status update, typically up to 372 characters.
      # @option params [String] :screen_name The screen name of the user for whom to send message.
      # @option params [Integer] :user_id The ID of the user for whom to send message.
      def new_message(params = {})
        response = post('secret_mails/new.json', params)
        Croudia::Object::SecretMail.new(response)
      end

      # Sends a new message with image to the specified user from the authenticating user.
      #
      # @see https://developer.croudia.com/docs/26_secret_mails_new_with_media
      # @return [Croudia::Object::SecretMail] Sent message.
      # @param params [Hash] A customized options.
      # @option params [String] :text The text of your status update, typically up to 372 characters.
      # @option params [File] :media Attachment image as PNG, JPEG or GIF format.
      # @option params [String] :screen_name The screen name of the user for whom to send message.
      # @option params [Integer] :user_id The ID of the user for whom to send message.
      def new_message_with_media(params = {})
        response = post('secret_mails/new_with_media.json', params)
        Croudia::Object::SecretMail.new(response)
      end

      # Deletes the authenticating user's sent message.
      #
      # @see https://developer.croudia.com/docs/24_secret_mails_destroy
      # @return [Croudia::Object::SecretMail] Deleted message.
      # @param status [Croudia::Object::SecretMail] Delete status.
      def delete_message(status)
        response = post("secret_mails/destroy/#{status.id}.json")
        Croudia::Object::SecretMail.new(response)
      end

      # Returns a single message, specified by the id parameter.
      #
      # @see https://developer.croudia.com/docs/25_secret_mails_show
      # @return [Croudia::Object::SecretMail] Message specified by id. 
      # @param status [Croudia::Object::SecretMail] Message.
      def message(status)
        response = get("secret_mails/show/#{status.id}.json")
        Croudia::Object::SecretMail.new(response)
      end

      # Returns the URI of the image that attached to message.
      # 
      # @see https://developer.croudia.com/docs/27_secret_mails_get_secret_photo
      # @return [String] URL of attaching message.
      # @param status [Croudia::Object::SecretMail] Status.
      def message_photo(status)
        "https://api.croudia.com/secret_mails/get_secret_photo/#{status.id}.json"
      end
    end
  end
end
