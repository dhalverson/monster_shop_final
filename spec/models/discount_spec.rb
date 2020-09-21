require 'rails_helper'

RSpec.describe Discount do
  describe 'Relationships' do
    it {should belong_to :merchant}

  end

  describe 'Validations' do
    it { should validate_numericality_of :discount }
    it { should validate_numericality_of :item_quantity }
    it { should validate_presence_of :discount }
    it { should validate_presence_of :item_quantity }

  end
end
