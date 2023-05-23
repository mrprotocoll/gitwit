class TwitterAccountsController < ApplicationController
    before_action :require_login!
    
    def index
        @twitter_accounts = Current.user.twitter_accounts
    end
end
