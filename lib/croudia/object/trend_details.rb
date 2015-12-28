require 'croudia/object/base'

module Croudia
  module Object
    class TrendDetails < Base
      attr_reader :name, :query, :promoted_content
    end
  end
end
