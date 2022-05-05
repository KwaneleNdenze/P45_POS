class ProductsController < ApplicationController
  def index
    
    @products = Product.all
    authorize @products
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  def new 
    @product = Product.new
    authorize @product

  end

  def create
    
    @product = Product.new(product_params)
    authorize @product
 
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
 
    authorize @product
    if @product.update(product_params)
    redirect_to @product, notice: 'Product was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    
 
  redirect_to products_path, notice: 'Product was successfully deleted.'
  end

  private
  def product_params
    params.require(:product).permit(:item_name, :description, :price, :user_id, :is_in_stock)
  end

end