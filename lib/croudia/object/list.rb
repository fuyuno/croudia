require 'croudia/object/cursor'
require 'croudia/object/user'

module Croudia
  module Object
    class List < Cursor
      attr_reader_as_array_object :users, User
    end
  end
end
