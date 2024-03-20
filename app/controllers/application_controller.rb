class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken

    protect_from_forgery unless: -> { request.format.json? }
    include Pundit::Authorization

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    before_action :configure_permitted_parameters, if: :devise_controller?
	respond_to :json

	protected
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password,:confirm_password])
	end

    private

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end
end
