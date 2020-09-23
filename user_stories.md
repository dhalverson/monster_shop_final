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

3. The ability to create a new discount, from the merchant discounts

4. The ability to delete a discount

5. The ability to update an existing discount

IT2 User Stories

1. You will implement a percentage based discount:
  As a user, when I add any item to my cart, and proceed to checkout, I see a discount applied. The discount is shown in the cart, and the price is reflected in the subtotal

2. Next, your discount method is updated so it only occurs after a threshold of the same item is reached. 10% discount on 2 or more items. Once I meet or exceed this threshold, the discount applies. Once I exceed 5 of the same item, a 20% discount is applied. I see the discount reflected in the total, as well as a discount dollar amount listed. Other items from other merchants are not affected by this discount.







3. Add items from two different merchants to your cart, exceeding the discount quantity. Verify that the discount only applies to items from the merchant with that discount.

4. Add multiple items, under the discount threshold from the same merchant, and verify the discount does not apply.

5. When there is a conflict between two discounts, the greater will apply. Add a lesser quantity, verify the discount, and then increase the quantity and verify the discount updates and is the higher of the two.

6. Final discounted price should show on the order show page.









methods
- eligible discount for that item, meets quantity
- compare subtotals of items, and return the lowest(highest discount)
- logic to apply discount to only items in the cart who's id's match an item.merchant that has a discount. filter



default discount
once hits threshold, then apply new discount
max_discount

comparing subtotals using subtotal_of
