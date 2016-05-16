class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  def index
    @products = Product.order(:name).where('user_id = ?', current_user.id).paginate(page: params[:page],:per_page => 6)
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      flash[:success] = "Product was successfully created"
      redirect_to products_url
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product successfully updated"
      redirect_to products_url
    else
      render 'edit'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    flash[:success] = "Product deleted successfully"
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :state, :user_id, :ingredients, :spicy, :price)
    end

    def admin
    redirect_to(products_url) unless current_user.email == "me@gmail.com"
  end

  end
