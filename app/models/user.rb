class User < ApplicationRecord
    has_many :twitter_accounts
    has_many :tweets
    has_secure_password
end
