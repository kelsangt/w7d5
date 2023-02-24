class SessionsController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

    def new 
        render :new  #this is the login page
    end

    def create  # this is the submit button
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user 
            login(@user)
            redirect_to user_url(@user)
        else
            render :new 
        end
    end

    def destroy 
        logout!
        redirect_to new_session_url
    end

end