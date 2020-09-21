class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :discount
  validates_presence_of :item_quantity
  validates_numericality_of :discount
  validates_numericality_of :item_quantity

end
