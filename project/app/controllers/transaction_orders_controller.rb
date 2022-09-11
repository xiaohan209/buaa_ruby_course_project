class TransactionOrdersController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :set_transaction_order, only: [:show, :edit, :update, :destroy,:transfer_order_status_pay,:transfer_order_status_deliver,:transfer_order_status_get]


  # GET /transaction_orders
  # GET /transaction_orders.json
  def index
    @transaction_orders = TransactionOrder.all
  end

  # GET /transaction_orders/1
  # GET /transaction_orders/1.json
  def show
  end

  # GET /transaction_orders/new
  def new
    @transaction_order = TransactionOrder.new
  end

  # GET /transaction_orders/1/edit
  def edit
  end

  def transfer_order_status_pay
    if @transaction_order.order_status == "未付款"
      @transaction_order.order_status = "未发货"
      @transaction_order.save
    end
    redirect_to request.referer
  end

  def transfer_order_status_deliver
    if @transaction_order.order_status == "未发货"
      @transaction_order.order_status = "未收货"
      @transaction_order.save
    end
    redirect_to request.referer
  end

  def transfer_order_status_get
    if @transaction_order.order_status == "未收货"
      @transaction_order.order_status = "已收货"
      @transaction_order.save
    end
    redirect_to request.referer
  end

  # POST /transaction_orders
  # POST /transaction_orders.json
  def create
    data = transaction_order_params
    @transaction_order = TransactionOrder.new(data)
    user_id = data[:user_id].to_i
    @submit_user = User.find(user_id)
    cart_items_of_user = CartItem.find_by_sql(["SELECT * FROM cart_items WHERE user_id = ?",user_id])


    respond_to do |format|
      if @transaction_order.save
        cart_items_of_user.each do |cart_item|
          purchase_product_id = cart_item.product_id
          @purchase_product = Product.find(purchase_product_id)
          @purchase_product.sales += 1
          @purchase_design = Design.find(@purchase_product.design_id)
          @purchase_design.sales += 1
          @purchase_design.save
          @transaction_item = TransactionItem.new
          @transaction_item.user_id = user_id
          @transaction_item.product_id = purchase_product_id
          @transaction_item.quantity = cart_item.quantity
          @transaction_item.price = @purchase_product.retail_price
          @transaction_item.transaction_order_id = @transaction_order.id
          @purchase_product.save
          @transaction_item.save
          CartItem.destroy(cart_item.id)
        end

        format.html { redirect_to @transaction_order, notice: '订单创建成功.' }
        format.json { render :show, status: :created, location: @transaction_order }
      else
        format.html { render :new }
        format.json { render json: @transaction_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_orders/1
  # PATCH/PUT /transaction_orders/1.json
  def update
    respond_to do |format|
      if @transaction_order.update(transaction_order_params)
        format.html { redirect_to @transaction_order, notice: 'Transaction order was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction_order }
      else
        format.html { render :edit }
        format.json { render json: @transaction_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_orders/1
  # DELETE /transaction_orders/1.json
  def destroy
    @transaction_order.destroy
    respond_to do |format|
      format.html { redirect_to transaction_orders_url, notice: 'Transaction order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_order
      @transaction_order = TransactionOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_order_params
      data = params.require(:transaction_order).permit(:deal_sum, :user_id, :delivery_address, :delivery_name, :delivery_phone, :delivery_postcode, :order_status)
      data
    end
end
