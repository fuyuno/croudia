require 'croudia/object/relationship'
require 'croudia/object/relationship_collection'
require 'croudia/object/user'

module Croudia
  module Rest
    module FriendShips

      # Allows the authenticating users to follow the user specified in the ID parameter.
      #
      # @see https://developer.croudia.com/docs/41_friendships_create
      # @return [Croudia::Object::User] The befriended user in the requested format when successful.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the user for whom to befriend.
      # @option params [Integer] :user_id The ID of the user for whom to befriend.
      def follow(params = {})
        response = post('friendships/create.json', params)
        Croudia::Object::User.new(response)
      end

      # Allows the authenticating user to unfollow the user specified in the ID parameter.
      #
      # @see https://developer.croudia.com/docs/42_friendships_destroy
      # @return [Croudia::Object::User] The unfollowed user in the requested format when successful.
      # @param params [Hash] A customized options.
      # @option params [String] :screen_name The screen name of the user for whom to unfollow.
      # @option params [Integer] :user_id The ID of the user for whom to unfollow.
      def unfollow(params = {})
        response = post('friendships/destroy.json', params)
        Croudia::Object::User.new(response)
      end

      # Returns detailed information about the relationship between two arbitrary users.
      #
      # @see https://developer.croudia.com/docs/44_friendships_show
      # @return [Croudia::Object::Relationship] The relationship between two arbitrary users.
      # @param params [Hash] A customized options.
      # @option params [Integer] :source_id The user_id of the subject user.
      # @option params [String] :source_screen_name The screen_name of the subject user.
      # @option params [Integer] :target_id The user_id of the target user.
      # @option params [String] :target_screen_name The screen_name of the target user.
      def relationship(params = {})
        response = get('friendships/show.json', params)
        Croudia::Object::Relationship.new(response)
      end

      # Returns the relationships of the authenticating user to the comma-separated list of up to 100 screen_names or user_ids provided.
      #
      # @see https://developer.croudia.com/docs/47_friendships_lookup
      # @return [Croudia::Object::RelationshipCollection]
      # @param params [Hash] A customized options.
      # @option params [Integer] :user_id The comma-separated list of user_ids.
      # @option params [String] :screen_name The comma-separated list of screen_names.
      def relationships(params = {})
        response = get('friendships/lookup.json', params)
        Croudia::Object::RelationshipCollection.new(response)
      end
    end
  end
end
