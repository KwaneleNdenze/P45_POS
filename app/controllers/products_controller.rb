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

  def performance_summary
    @popular_products = Product.where("sale_count > ?", 1)
    @unpopular_products = Product.where("return_count > ?", 1)
  end

  def return_item
    @product = Product.find(params[:id])
    @product.increment!(:return_count)
    redirect_to purchases_path, notice: 'Product was successfully returned.'
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    
 
  redirect_to products_path, notice: 'Product was successfully deleted.'
  end

  private
  def product_params
    params.require(:product).permit(:item_name, :description, :price, :user_id, :is_in_stock, :sale_count, :return_count)
  end

end