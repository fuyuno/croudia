require 'croudia/object/base'

module Croudia
  module Object
    class Cursor < Base
      attr_reader :next_cursor, :next_cursor_str, :previous_cursor, :previous_cursor_str
    end
  end
end
