class Article < ApplicationRecord
  belongs_to :user
  validates :description, presence: true,
                          length: { minimum: 10 }
  validates :name, presence: true,       
                    length: { minimum: 3, maximum: 50 } 
end