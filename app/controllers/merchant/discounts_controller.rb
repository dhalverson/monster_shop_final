class Merchant::DiscountsController < Merchant::BaseController

  def index
    @merchant = Merchant.find(current_user.merchant.id)
    @discounts = Discount.where('merchant_id = ?', @merchant.id)
  end

  def show
  end

end
