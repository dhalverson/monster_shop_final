require 'rails_helper'

RSpec.describe "As a user" do
  describe "When I checkout" do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
      @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 2 )
      @hippo = @brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
      @discount_1 = @megan.discounts.create!(discount: 10, item_quantity: 2)
      @discount_2 = @megan.discounts.create!(discount: 20, item_quantity: 5)

      visit("/items/#{@ogre.id}")
      click_button('Add to Cart')
    end

    it 'I dont see a discount if the items dont exceed the discounts quantity' do
      visit('/cart')
      expect(page).to have_content('$20.00')
      within "#item-#{@ogre.id}" do
        expect(page).to have_content('Price: $20.00')
        expect(page).to have_content('Quantity: 1')
        expect(page).to have_content('Subtotal: $20.00')
      end
    end

    it 'Once I exceed the quantity for a merchants first discount, my prices are discounted by that percent off' do
      visit('/cart')
      within "#item-#{@ogre.id}" do
        click_button('More of This!')
      end
      expect(page).to have_content('$36.00')
      within "#item-#{@ogre.id}" do
        expect(page).to have_content('Price: $20.00')
        expect(page).to have_content('Quantity: 2')
        expect(page).to have_content('Discounted Subtotal: $36.00')
      end
    end

    it 'Once I exceed my discounts second tier, my prices are discounted by the second amount' do
      visit('/cart')
      within "#item-#{@ogre.id}" do
        4.times do
          click_button('More of This!')
        end
      end
      within "#item-#{@ogre.id}" do
        expect(page).to have_content('Price: $20.00')
        expect(page).to have_content('Quantity: 5')
        expect(page).to have_content('Discounted Subtotal: $80.00')
      end
    end




  end
end
