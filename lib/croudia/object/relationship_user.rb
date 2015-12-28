require 'croudia/object/identity'

module Croudia
  module Object
    class RelationshipUser < Identity 
      attr_reader :blocking, :muting, :followed_by, :following, :screen_name
    end
  end
end
