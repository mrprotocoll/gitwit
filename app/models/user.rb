class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets

  has_secure_password

  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'email must be a valid email address' }
end
