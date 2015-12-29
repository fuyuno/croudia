module Croudia
  class Error < StandardError

    attr_reader :code, :message

    ClientError = Class.new(self)

    # 400 ~
    BadRequest = Class.new(ClientError)
    Unauthorized = Class.new(ClientError)
    Forbidden = Class.new(ClientError)
    NotFound = Class.new(ClientError)
    NotAcceptable = Class.new(ClientError)
    Gone = Class.new(ClientError)                # x
    UnprocessableEntity = Class.new(ClientError) # x
    TooManyRequests = Class.new(ClientError)     # x

    
    ServerError = Class.new(self)

    # 500 ~
    InternalServerError = Class.new(ServerError)
    BadGateway = Class.new(ServerError)
    ServiceUnavailable = Class.new(ServerError)
    GatewayTimeout = Class.new(ServerError)

    ERRORS = {
      "400" => Croudia::Error::BadRequest,
      "401" => Croudia::Error::Unauthorized,
      "403" => Croudia::Error::Forbidden,
      "404" => Croudia::Error::NotFound,
      "406" => Croudia::Error::NotAcceptable,
      "410" => Croudia::Error::Gone,
      "422" => Croudia::Error::UnprocessableEntity,
      "429" => Croudia::Error::TooManyRequests,
      "500" => Croudia::Error::InternalServerError,
      "502" => Croudia::Error::BadGateway,
      "503" => Croudia::Error::ServiceUnavailable,
      "504" => Croudia::Error::GatewayTimeout
    }

    def initialize(code, message)
      super(message)

      @code = code
      @message = message
    end

    class << self
      def from_response(response)
        if (response.body.nil? || response.body.strip.empty?)
          ERRORS[response.code.to_s].new(response.code, 'No message')
        else
          ERRORS[response.code.to_s].new(response.code, JSON.parse(response.body).message)  
        end
      end
    end
  end
end
