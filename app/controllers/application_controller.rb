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


    @lgb = Book.joins(:book_values, :values).where(:values => {:id => '1'})
    @trans = Book.joins(:book_values,:values).where(:values {:id  => '2')
    @poc = Book.joins(:book_values, :values).where(:values => {:id => '3'})
    @disability = Book.joins(:book_values, :values).where(:values => {:id => '5'})
    @women = Book.joins(:book_values, :values).where(:values => {:id => '4'})
  end


end