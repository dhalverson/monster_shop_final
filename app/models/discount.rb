class Discount < ApplicationRecord
  belongs_to :merchant

  validates_inclusion_of :discount, :in 1..99
  validates_numericality_of :item_quantity, only_integer: true

end
