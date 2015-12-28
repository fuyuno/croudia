require 'croudia/object/base'
require 'croudia/object/relationship_user'

module Croudia
  module Object
    class Relationship < Base
      attr_reader_as_object :source, RelationshipUser
      attr_reader_as_object :target, RelationshipUser
    end
  end
end
