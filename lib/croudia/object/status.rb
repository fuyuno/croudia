require 'croudia/object/identity'
require 'croudia/object/entities'
require 'croudia/object/user'
require 'croudia/object/source'

module Croudia
  module Object
    class Status < Identity
      attr_reader :text, :favorited, :favorited_count, 
        :spread, :spread_count, :in_reply_to_status_id,
        :in_reply_to_status_id_str, :in_reply_to_user_id,
        :in_reply_to_user_id_str, :created_at

      attr_reader_as_object :entities, Entities
      attr_reader_as_object :source, Source
      attr_reader_as_object :user, User
      attr_reader_as_object :spread_status, Status
      attr_reader_as_object :quote_status, Status
    end
  end
end
