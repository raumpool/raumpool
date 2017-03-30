class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

WillPaginate.per_page = 30

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Loggen Sie sich bitte ein."
        redirect_to login_url
      end
    end
end
