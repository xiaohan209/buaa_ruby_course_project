class CartItemsController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy,:increase_cart_item_count,:decrease_cart_item_count]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    data = cart_item_params
    current_item = nil
    cart_items = CartItem.all
    puts(cart_items)
    cart_items.each do |item|
      if item.product_id == Integer(data[:product_id]) and item.user_id == Integer(data[:user_id])
        puts(data[:product_id])
        puts(data[:user_id])
        current_item = item
        break
      end
    end
    if current_item
      @cart_item = current_item
      @cart_item.quantity += Integer(data[:quantity])
    else
      @cart_item = CartItem.new(cart_item_params)
    end

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to cart_items_path, notice: 'Cart item was successfully created.' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html {
          #render :new
        }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def increase_cart_item_count
    @cart_item.quantity += Integer(params[:number])
    @cart_item.save
    redirect_to cart_items_path
  end

  def decrease_cart_item_count
    decrease = Integer(params[:number])
    if @cart_item.quantity <= decrease
      destroy
    else
      @cart_item.quantity -= decrease
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      data = params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end
end
