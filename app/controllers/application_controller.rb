class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :uid
  end

  def header
    @user = current_user.first_name
    @user_image = current_user.image
  end

  def valueslist

    # @lgb = Book.all.where(:value_id => )
    # @trans = 
    # @poc =
    # @disability =
    # @women = 
  end


end