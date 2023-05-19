class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @greeting = "Hi #{params[:user].email}"
    @token = params[:user].signed_id(expires: 15.mintues, purpose: "Password reset")

    mail to: params[:user].email
  end
end
