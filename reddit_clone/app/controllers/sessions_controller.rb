class SessionsController < ApplicationController

    before_action :require_logged_in

    helper_methods :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in

        if session[:session_token] = current_user.session_token

    end

    def logged_in?
        !!current_user
    end

    def login(user)
        self.session_token = user.reset_session_token!
    end

    def logout(user)
        current_user.reset_session_token! if logged_in? 
        session[:session_token] = nil
        @current_user = nil
    end


    

end