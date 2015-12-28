require 'croudia/object/identity'

module Croudia
  module Object
    class RelationshipCollection < Identity
      attr_reader :connections, :name, :screen_name
    end
  end
end
