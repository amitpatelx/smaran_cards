class Source < ApplicationRecord
  has_many :cards, dependent: :restrict_with_error
  
  validates :title, presence: true
end
