class OmniauthCallbacksController < ApplicationController
  def twitter
    redirect_to root_path, alert: 'Oops you have to sign in' and return unless Current.user.twitter_accounts.create(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to twitter_accounts_path, notice: 'Twitter account successfully connected'
  end

  def github
    p auth
    redirect_to root_path, alert: 'Oops you have to sign in' and return unless Current.user.github_accounts.create(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to github_accounts_path, notice: 'Github account successfully connected'
  end

  def auth
    request.env['omniauth.auth']
  end
end
