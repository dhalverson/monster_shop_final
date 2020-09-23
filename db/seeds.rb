# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
brian = Merchant.create!(name: 'Brians Bagels & Dog Palace', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)

ogre = megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100 )
giant = megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 75 )
hippo = brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
pull_toy = brian.items.create!(name: 'Pull Toy', description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", active: true, inventory: 32)
dog_bone = brian.items.create!(name: 'Dog Bone', description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active:true, inventory: 21)

merchant_user = User.create!(name: 'MeganMerchant', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'merchantadmin@merchantadmin.com', password: '123', role: 1, merchant_id: megan.id)
user = User.create!(name: 'MeganUser', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'user@user.com', password: '123')

discount_1 = megan.discounts.create!(discount: 10, item_quantity: 2)
discount_2 = megan.discounts.create!(discount: 20, item_quantity: 5)
