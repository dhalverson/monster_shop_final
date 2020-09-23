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

  def new
  end

  def create
    merchant = Merchant.find(current_user.merchant.id)
    discount = merchant.discounts.create(discount_params)
    if discount.save
      flash[:success] = 'Success, a new discount has been added!'
      redirect_to('/merchant/discounts')
    else
      flash[:error] = discount.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    Discount.destroy(params[:id])
    redirect_to('/merchant/discounts')
  end

  private

  def discount_params
    params.permit(:discount, :item_quantity)
  end

end
