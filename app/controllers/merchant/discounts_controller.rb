class Merchant::DiscountsController < Merchant::BaseController

  def index
    @merchant = Merchant.find(current_user.merchant.id)
    @discounts = Discount.where('merchant_id = ?', @merchant.id)
  end

  def show
    @discount = Discount.find(params[:id])
  end

  def edit
    @discount = Discount.find(params[:id])
  end

  def update
    @discount = Discount.find(params[:id])
    @discount.update(discount_params)
    if @discount.save
      redirect_to "/merchant/discounts/#{@discount.id}"
    else
      flash[:error] = @discount.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def discount_params
    params.permit(:discount, :item_quantity)
  end

end
