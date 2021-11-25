class RegisterController < ApplicationController
    def newuser
        @user = User.new
    end

    def createUser
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to root_path, notice: "Successfully created account"
        else
            render :newuser    #render sign up form again
        end
    end

    private
    def user_params
        params.required(:user).permit(:email, :password, :password_confirmation)
        #return params[:user]

    end


end