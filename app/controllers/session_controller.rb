class SessionController < ApplicationController
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "logged out"
    end

    def logInScreen
    end

    def signInUser
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Signed In"
        else
            flash[:alert] = "Invalid Email or password"
            render :logInScreen
        end

    end

end