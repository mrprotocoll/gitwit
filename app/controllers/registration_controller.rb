class RegistrationController < ApplicationController
    def new
        @user = User.new
    end
end
