require 'rails_helper'

RSpec.describe "As a merchant employee" do
  before :each do
    @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
    @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100 )
    @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 75 )
    @merchant_user = User.create!(name: 'MeganMerchant', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'merchant@example.com', password: '123', role: 1, merchant_id: @megan.id)
    @user = User.create!(name: 'MeganUser', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'meganuser@example.com', password: 'securepassword')
    @order_1 = @user.orders.create!(status: "pending")
    @order_item_1 = @order_1.order_items.create!(item: @ogre, price: @ogre.price, quantity: 1, fulfilled: true)
    @order_item_2 = @order_1.order_items.create!(item: @giant, price: @giant.price, quantity: 5, fulfilled: true)
    @discount_1 = @megan.discounts.create!(discount: 20, item_quantity: 2)
    @discount_2 = @megan.discounts.create!(discount: 30, item_quantity: 5)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_user)
  end

  it 'From a discounts show page, I see a link to delete a discount' do
    visit("/merchant/discounts/#{@discount_1.id}")
    expect(page).to have_link('Delete Discount')

  end

  it 'When I click delete discount, I am taken back to the discounts index where I no longer see this discount' do
    visit("/merchant/discounts/#{@discount_1.id}")
    click_link('Delete Discount')
    expect(current_path).to eq('/merchant/discounts')
    expect(page).to_not have_content("#{@discount_1.discount}")
    expect(page).to_not have_content("#{@discount_1.item_quantity}")
  end
end
