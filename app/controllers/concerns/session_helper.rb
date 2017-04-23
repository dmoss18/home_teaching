module SessionHelper
  extend ActiveSupport::Concern
  include Knock::Authenticable
  # Note: current_user is provided by Knock::Authenticable (see initializers/knock.rb)

  included do
    def authenticate_admin_user!
      return current_user if authenticated?

      flash[:notice] = 'You are not allowed to access this portion of the site.'
      redirect_to new_session_path
    end


    def authenticated?
      !current_user.nil?
    end
  end
end
