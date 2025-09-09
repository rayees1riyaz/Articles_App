class User < ApplicationRecord
  # Name validation
  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 3, maximum: 20 }

  # Email validation
  validates :email, presence: true,
                    uniqueness: true, { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "must be a valid email address" }
end
