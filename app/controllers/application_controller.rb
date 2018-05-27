class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render html: "hello, world!"
  end

  private

    def logged_in_user
      if not logged_in?
        # GET   /users/:id/edit
        # PATCH /users/:id
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
