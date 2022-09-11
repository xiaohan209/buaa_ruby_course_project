
class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    data = product_params
    data[:favorites] = 0
    data[:sales] = 0
    @product = Product.new(data)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      data = product_params
      if @product.update(data)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy

    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params

      data = params.require(:product).permit(:product_name, :design_id, :color_id, :size_id, :retail_price, :description,:favorites,:sales, :image_file, :gender, :product_type_id)
      upload_file = data[:image_file]
      if upload_file == nil
        data[:image_directory] = "default/default_product_img.png"
      else
        image_file_name = SecureRandom.uuid + "-" + upload_file.original_filename
        image_path = 'product_image/' + image_file_name
        image_path_real = Rails.root.join('public', 'product_image', image_file_name)
        File.open(image_path_real, 'wb') do |file|
          file.write(upload_file.read)
        end
        data[:image_directory] = image_path
      end
      data.delete(:image_file)

      data
    end
end



