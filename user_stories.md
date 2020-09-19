1. Merchants need full CRUD functionality on bulk discounts, and will be accessed a link on the merchant's dashboard.
1. You will implement a percentage based discount:
   - 5% discount on 20 or more items
1. A merchant can have multiple bulk discounts in the system.
1. When a user adds enough value or quantity of a single item to their cart, the bulk discount will automatically show up on the cart page.
1. A bulk discount from one merchant will only affect items from that merchant in the cart.
1. A bulk discount will only apply to items which exceed the minimum quantity specified in the bulk discount. (eg, a 5% off 5 items or more does not activate if a user is buying 1 quantity of 5 different items; if they raise the quantity of one item to 5, then the bulk discount is only applied to that one item, not all of the others as well)
1. When there is a conflict between two discounts, the greater of the two will be applied.
1. Final discounted prices should appear on the orders show page.

Items: Belong to merchant, has many orders through order items, has many reviews
Merchants: Has many items, has many orders through order items, has many users, ** has many discounts
Order: Has many items though order items, belongs to user
Order_Items: Belongs to an order and item
Reviews: Belongs to an item
Users: Belongs to a merchant, has many orders
** Discount: Belongs to a merchant

Discount, one to many table


1. As a merchant, I can click a link that will take me to all my discounts show page.
2. When I visit /merchant/discounts, I see two discounts, 20% and 30%. In order to hit 20 I have to have 5 or more items. In order to hit 30,  I have to have 10 or more items.
