class OmniauthCallbacksController < ApplicationController
  def twitter
    if(Current.user.present?)
        Current.user.twitter_accounts.create(
            name: auth.info.name,
            username: auth.info.nickname,
            image: auth.info.image,
            token: auth.credentials.token,
            secret: auth.credentials.secret
        )
    else
        redirect_to root_path, alert: "Oops you have to sign in" and return
        
    end

    redirect_to root_path, notice: "Twitter account successfully connected"
  end

  def auth
    request.env['omniauth.auth']
  end
end
