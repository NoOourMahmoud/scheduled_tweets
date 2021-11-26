class TwitterAccountsController < ApplicationController
    before_action :require_user_login
    before_action :set_twitter_account, only: [:destory]

    def index
        @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
        @twitter_accounts.destroy
        redirect_to twitter_accounts_path , alert: "Successfully disconnected @#{@twitter_accounts.username}"
    end

    private

    def set_twitter_account
        @twitter_accounts = Current.user.twitter_accounts.find(params[:id])
    end
end