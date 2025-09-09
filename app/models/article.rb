class Article < ApplicationRecord
   validates :email, presence: true,       # must be filled
                    uniqueness: true, { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, 
                              message: "must be a valid email address" }

  # Title validation
  validates :name, presence: true,       
                    length: { minimum: 3, maximum: 50 } 
end
end
