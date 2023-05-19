class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            # send mail 
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to login_path, notice: "Reset your password using the link sent to your email"
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        # catch error when user cannot be found 
        rescue ActiveSupport::MessageVerifier::InvalidSignature
            redirect_to login_path, alert: "Your token has expired. Please try again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")

        if @user.update(password_params)
            # redirect to login page 
            redirect_to login_path, notice: "Password reset successfully"
        else
            flash[:alert] = "oops something went wrong. Please try again"
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
