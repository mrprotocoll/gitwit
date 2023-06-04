class GithubAccountsController < ApplicationController
  before_action :require_login!
  before_action :set_github_account, only: [:destroy]

  def index
    @github_accounts = Current.user.github_accounts
  end

  def destroy
    @github_account.destroy

    redirect_to github_accounts_path, notice: "Disconnected @#{@github_account.username}"
  end

  private

  def set_github_account
    @github_account = Current.user.github_accounts.find(params[:id])
  end
end
