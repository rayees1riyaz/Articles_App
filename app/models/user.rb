class User < ApplicationRecord
  has_many :articles
  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 3, maximum: 20 }

  # Email validation
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "must be a valid email address" }
end
