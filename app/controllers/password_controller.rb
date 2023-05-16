class PasswordController < ApplicationController
    before_action :require_login!

    def edit
    end

    def update
        user = Current.user.update(update_params)
        if user
            redirect_to profile_path, notice: 'Password changed successfully'
        else
            render :edit
        end
    end

    private

    def update_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
