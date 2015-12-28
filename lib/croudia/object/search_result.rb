require 'croudia/object/base'
require 'croudia/object/search_metadata'
require 'croudia/object/status'

module Croudia
  module Object
    class SearchResult < Base
      attr_reader_as_array_object :statuses, Status
      attr_reader_as_object :search_meta, SearchMetadata
    end
  end
end
