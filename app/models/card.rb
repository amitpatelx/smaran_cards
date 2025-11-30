class Card < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :source, optional: true
  
  has_rich_text :quote
  has_rich_text :commentary
  
  validates :quote, presence: true

  def to_json_export
    {
      id: id.to_s,
      quote: html_to_markdown(quote.to_trix_html),
      author: author&.name,
      source: source&.title,
      commentary: html_to_markdown(commentary.to_trix_html).presence
    }.compact
  end

  private

  def html_to_markdown(html)
    return "" if html.blank?
    ReverseMarkdown.convert(html).strip
  end
end
