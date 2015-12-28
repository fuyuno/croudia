require 'croudia/object/identity'

module Croudia
  module Object
    class User < Identity 
      attr_reader :name, :screen_name, :profile_image_url_https,
        :cover_image_url_https, :created_at, :description, :favorites_count,
        :follow_request_sent, :followers_count, :following, :friends_count,
        :location, :statuses_count, :protected, :url
      
      alias_method :cover, :cover_image_url_https
      alias_method :icon, :profile_image_url_https
    end
  end
end
