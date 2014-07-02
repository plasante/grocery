class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # to have the methods from the Sessions helper available in both controllers and views.
  include SessionsHelper
end
