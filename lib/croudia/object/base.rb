module Croudia
  module Object
    class Base
      attr_reader :attrs

      def initialize(attrs = {})
        @attrs = attrs || {}
        @attrs.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      class << self
        def attr_reader_as_object(attribute, object)
          define_method(attribute.to_s) do
            Object.const_get(object.to_s).new(@attrs[attribute.to_s])
          end
        end

        def attr_reader_as_array_object(attribute, object)
          define_method(attribute.to_s) do
            @attr[attribute.to_s].map do |obj|
              Object.const_get(object.to_s).new(obj)
            end
          end
        end
      end
    end
  end
end
