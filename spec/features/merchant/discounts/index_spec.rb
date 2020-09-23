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

  it 'From my merchant admin view, there is a link to view all my discounts' do
    visit '/merchant'
    expect(page).to have_link('My Discounts')
    click_link('My Discounts')
    expect(current_path).to eq("/merchant/discounts")
  end

  it 'I can visit a merchants discounts page, and see all discounts' do
    visit('/merchant')
    click_link('My Discounts')
    click_link('20% off')
    expect(current_path).to eq("/merchant/discounts/#{@discount_1.id}")
    @megan.discounts.each do |discount|
      expect(page).to have_content("#{@discount_1.discount}")
      expect(page).to have_content("#{@discount_1.item_quantity}")
    end
  end

  it 'I see a link to create a new discount' do
    visit('/merchant')
    click_link('My Discounts')
    expect(current_path).to eq('/merchant/discounts')
    expect(page).to have_link('New Discount')
  end

  it 'I click new discount and am taken to a form to create a new discount' do
    visit('/merchant/discounts')
    click_link('New Discount')
    expect(current_path).to eq('/merchant/discounts/new')
  end

  it 'If I dont fill out all the fields' do
    visit('/merchant/discounts')
    click_link('New Discount')

    fill_in :discount, with: 25
    click_button('Save Discount')

    expect(page).to have_content("Item quantity can't be blank and Item quantity is not a number")
  end

  it 'I fill out all the fields, click save, I am redirected to the index page and see my new discount' do
    visit('/merchant/discounts')
    click_link('New Discount')

    fill_in :discount, with: 25
    fill_in :item_quantity, with: 15
    click_button('Save Discount')

    expect(page).to have_content('Success, a new discount has been added!')
    expect(current_path).to eq('/merchant/discounts')
    expect(page).to have_content('25% off')
    expect(page).to have_content('Percentage: 25%')
    expect(page).to have_content('Item Quantity: 15')
  end
end
