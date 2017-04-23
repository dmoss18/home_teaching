class UsersController < ApiController
  before_action :authenticate_user, except: [:create]

  def create
    user = User.create!(user_params)
    user.authentication_token = Knock::AuthToken.new(payload: { sub: user.id }).token
    json_response(user, :created)
  end

  def show
    json_response User.find(params[:id])
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
