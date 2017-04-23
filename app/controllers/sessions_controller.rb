class SessionsController < ApplicationController
  # GET /sign_in
  def new
    if authenticated?
      redirect_to admin_root_path
      return
    end
  end

  # POST /sign_in
  def create
    user = User.find_by(email: auth_params[:email])
    if user &&  user.authenticate(auth_params[:password])
      auth_token = Knock::AuthToken.new(payload: user.to_token_payload)
      cookies[:remember_token] = auth_token.token
      redirect_to admin_root_path
    else
      flash[:error] = 'Invalid email or password'
      redirect_to new_session_path
    end
  end

  # DELETE /sign_out
  def destroy
    cookies.delete(:remember_token)

    redirect_to new_session_path
  end

  private

    def auth_params
      params.permit :email, :password
    end
end
