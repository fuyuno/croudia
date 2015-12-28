require 'croudia/object/base'

module Croudia
  module Object
    class SearchMetadata < Base
      attr_reader :completed_in, :max_id, :max_id_str, :since_id, :since_id_str,
        :count, :next_results, :query, :refresh_url
    end
  end
end
