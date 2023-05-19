class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find(email: params[:email])
        if @user.present?
        end

        redirect_to login_path, notice: "Reset your password using the link sent to your email"
    end
end
