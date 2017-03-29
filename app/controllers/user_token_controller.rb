class UserTokenController < Knock::AuthTokenController
  include Response
  include ExceptionHandler

  def create
    entity.authentication_token = auth_token.token
    json_response(entity, :created)
  end

  private

    def entity_class
      User
    end

    def auth_params
      params.permit :email, :password
    end
end
