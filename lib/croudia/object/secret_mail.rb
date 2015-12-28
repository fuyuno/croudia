require 'croudia/object/identity'
require 'croudia/object/entities'
require 'croudia/object/user'

module Croudia
  module Object
    class SecretMail < Identity
      attr_reader :text, :recipient_id, :recipient_screen_name, 
        :sender_id, :sender_screen_name, :created_at

      attr_reader_as_object :entities, Entities
      attr_reader_as_object :recipient, User
      attr_reader_as_object :sender, User
    end
  end
end
