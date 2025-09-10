class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :articles
  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 3, maximum: 20 }

  # Email validation
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "must be a valid email address" }
  has_secure_password
   
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, on: :create
  validates :password, length: { minimum: 6 }, allow_blank: true, confirmation: true, on: :update
end
