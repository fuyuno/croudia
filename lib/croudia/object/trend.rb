require 'croudia/object/base'
require 'croudia/object/location'
require 'croudia/object/trend_details'

module Croudia
  module Object
    class Trend < Base
      attr_reader :as_of, :created_at, :trends

      attr_reader_as_object :locations, Location
      attr_reader_as_array_object :trends, TrendDetails
    end
  end
end
