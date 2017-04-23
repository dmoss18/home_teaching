class ApiController < ActionController::API
  include Knock::Authenticable
  include Response
  include ExceptionHandler
end
