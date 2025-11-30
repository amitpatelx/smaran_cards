class Author < ApplicationRecord
  has_many :cards, dependent: :restrict_with_error
  
  validates :name, presence: true
end
