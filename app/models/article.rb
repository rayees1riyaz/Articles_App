class Article < ApplicationRecord
   validates :email, presence: true,       # must be filled
                    uniqueness: true,     # no duplicate emails
                    format: { with: URI::MailTo::EMAIL_REGEXP, 
                              message: "must be a valid email address" }

  # Title validation
  validates :name, presence: true,       # must be filled
                    length: { minimum: 3, maximum: 50 } # between 3–50 chars
end
end
