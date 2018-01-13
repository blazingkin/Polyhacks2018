class SessionsController < ApplicationController

    def create
        if Rails.env.test?
            user = Parent.find(params[:id])
        else
            user = Parent.from_omniauth(env["omniauth.auth"])
        end
        session[:user_id] = user.id
        redirect_to root_url
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end
