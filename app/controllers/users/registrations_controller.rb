# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
     before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
    #after_action :assign_role, only: :create
    # GET /resource/sign_up
    def new
      super
    end
  
    # POST /resource
    def create
      @user = User.new(user_params)
      roles = params[:user][:roles].is_a?(String) ? [params[:user][:roles]] : params[:user][:roles]
      @user.add_role(roles) 

      if @user.save
        redirect_to articles_path
      else
        render :new , status: :unprocessable_entity
      end
        

        # debugger
      #debugger
      #@role = params[:user][:roles]
      
      #@role = Role.find(id).name
      
    #   assign_default_role(role)
      #debugger
      #resource.add_role(role)
      #user= User.find(params[:id])
      
      #super
    end
  
    # GET /resource/edit
    # def edit
    #   super
    # end
  
    # PUT /resource
    # def update
    #   super
    # end
  
    # DELETE /resource
    # def destroy
    #   super
    # end
  
    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end
  
    # protected
  
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end
  
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end
  
    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end
  
    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  
    private
  
      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :roles])
      end
    
      def sign_up(resource_name, resource)
        resource.add_role(params[:user][:roles])
        # RegistrationsPresenter.new(resource)
        super
      end

      def assign_role
        User.last.add_role(@role)
      end

      def user_params
        params.require(:user).permit(:username, :email, :password, :roles)
      end
  
      # def build_resource(hash=nil)
      #   self.resource = User.new
      #   self.resource.roles.build if params[:user] && params[:user][:roles]
      #   RegistrationsPresenter.new(resource)
      # end
  
  end
  