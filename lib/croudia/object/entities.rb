require 'croudia/object/base'
require 'croudia/object/media'

module Croudia
  module Object
    class Entities < Base
      attr_reader_as_object :media, Media
    end
  end
end
