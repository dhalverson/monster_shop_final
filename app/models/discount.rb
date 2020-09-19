class Discount < ApplicationRecord
  belongs_to :merchant

  validates_numericality_of :discount
  validates_numericality_of :item_quantity

end
