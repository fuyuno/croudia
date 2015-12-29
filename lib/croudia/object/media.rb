require 'croudia/object/base'

module Croudia
  module Object
    class Media < Base
      attr_reader :media_url_https, :type
    end
  end
end
