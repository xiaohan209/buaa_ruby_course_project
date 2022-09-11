class FavoritesController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  def user_index
    @favorite_of_users = Favorite.find_by_user_id(Integer(params[:user_id]))

    # @favorites_of_users = []
    # @favorites.each do |favorite|
    #   if favorite.user_id == Integer(params[:user_id])
    #     @favorites_of_users << favorite
    #   end
    # end
  end

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    data = favorite_params
    user_id = data[:user_id]
    product_id = data[:product_id]
    exist_product = Favorite.find_by_sql(["SELECT * FROM favorites WHERE user_id = ? AND product_id = ?", user_id, product_id])
    @favorite_product = Product.find(product_id)
    product_name = @favorite_product.product_name
    if exist_product != nil && exist_product.count > 0
      exist_product[0].destroy
      @favorite_product.favorites -= 1
      @favorite_product.save
      respond_to do |format|
        format.html { redirect_to request.referer, notice: "取消收藏#{product_name}成功" }
        format.json { head :no_content }
      end
    else
      @favorite = Favorite.new(data)
      @favorite_product.favorites += 1
      @favorite_product.save
      respond_to do |format|
        if @favorite.save
          format.html { redirect_to request.referer, notice: "收藏#{product_name}成功" }
          format.json { render :show, status: :created, location: @favorite }
        else
          format.html { render :new }
          format.json { render json: @favorite.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def favorite_params
    params.require(:favorite).permit(:user_id, :product_id)
  end
end
