class ApiController < ActionController::API
  include Knock::Authenticable
  include Response
  include ExceptionHandler
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    error_response("Unauthorized", 403)
  end
end
