# require 'rails_helper'
#
# RSpec.describe "As a merchant admin" do
#   before :each do
#     @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
#     @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100 )
#     @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100 )
#     @hippo = @megan.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100 )
#     @user_1 = User.create!(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'megan_1@example.com', password: 'securepassword')
#     @merchant_admin = User.create!(name: 'MeganMerchant', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'merchant@example.com', password: '123', role: 1, merchant_id: @megan.id)
#     @order_1 = @user_1.orders.create!
#     @order_2 = @user_1.orders.create!
#     @order_1.order_items.create!(item: @ogre, price: @ogre.price, quantity: 5)
#     @order_2.order_items.create!(item: @giant, price: @hippo.price, quantity: 2)
#     @order_2.order_items.create!(item: @ogre, price: @hippo.price, quantity: 10)
#     @discount_1 = @megan.discounts.create!(discount: 20, item_quantity: 5)
#     @discount_2 = @megan.discounts.create!(discount: 30, item_quantity: 10)
#   end
#
#   it "When I visit my merchant's show page, I see a link to view my discounts" do
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_admin)
#
#     visit("/merchants/#{@megan.id}")
#     expect(page).to have_button('My Discounts')
#   end
#
#   it "When I click that link, I'm taken to my discounts show page" do
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_admin)
#
#     visit("/merchants/#{@megan.id}")
#     click_button('My Discounts')
#     expect(current_path).to eq("/merchants/#{@megan.id}/discounts")
#     expect(page).to have_content(@discount_1.discount)
#     expect(page).to have_content(@discount_1.item_quantity)
#     expect(page).to have_content(@discount_2.discount)
#     expect(page).to have_content(@discount_2.item_quantity)
#   end
# end
