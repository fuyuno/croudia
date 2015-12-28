require 'croudia/object/trend'

module Croudia
  module Rest
    module Trends

      # Returns the top 10 trending topics for a specific WOEID.
      #
      # @see https://developer.croudia.com/docs/100_trends_place
      # @return [Croudia::Object::Trend] Trends
      # @param params [Hash] A customized options.
      # @option params [Integer] :woeid Please set 1.
      def place(params = {})
        response = get('trends/place.json', params)
        Croudia::Object::Trend.new(response)
      end
    end
  end
end
