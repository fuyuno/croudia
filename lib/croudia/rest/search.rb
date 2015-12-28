require 'croudia/object/search_result'
require 'croudia/object/user'

module Croudia
  module Rest
    module Search

      def search_statuses(params = {})
        response = get('search/voices.json', params)
        Croudia::Object::SearchResult.new(response)
      end

      def search_users(params = {})
        response = get('users/search.json', params)
        response.map do |user|
          Croudia::Object::User.new(user)
        end
      end

      def search_users_by_profile(params = {})
        response = get('profile/search.json', params)
        response.map do |user|
          Croudia::Object::User.new(user)
        end
      end

      def search_favorites(params = {})
        response = get('search/favorites.json', params)
        Croudia::Object::SearchResult.new(response)
      end
    end
  end
end
