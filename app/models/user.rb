class User < ApplicationRecord
    has_many :twitter_accounts
    has_secure_password
end
