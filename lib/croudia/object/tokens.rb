require 'croudia/object/base'

module Croudia
  module Object
    class Tokens < Base
      attr_reader :access_token, :token_type, :expires_in, :refresh_token
    end
  end
end
