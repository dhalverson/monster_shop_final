class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :discount, :item_quantity
  validates_numericality_of :discount, :item_quantity

end
