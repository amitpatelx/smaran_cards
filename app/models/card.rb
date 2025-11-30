class Card < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :source, optional: true
  
  has_rich_text :quote
  has_rich_text :commentary
  
  validates :quote, presence: true
end
