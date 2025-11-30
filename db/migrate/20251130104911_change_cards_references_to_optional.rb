class ChangeCardsReferencesToOptional < ActiveRecord::Migration[8.1]
  def change
    change_column_null :cards, :author_id, true
    change_column_null :cards, :source_id, true
  end
end
