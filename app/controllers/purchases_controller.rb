class PurchasesController < ApplicationController

  def index
    @products = Product.all
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
    authorize @purchase
  end

  def create 
    @purchase = Purchase.new(product_ids: purchase_params[:product_ids].reject(&:blank?))
    @products = Product.where(id: purchase_params[:product_ids])
    @products.each do |product| 
      product.increment!(:sale_count)
    end
    @purchase.id
    
    authorize @purchase
    
      if @purchase.save

        redirect_to @purchase, notice: 'Purchase was successfully created.'
      else
        render 'new'
      end 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def searchform
    
  end

  def searchrange
    start_date = format_date_string('start_date')
    end_date = format_date_string('end_date')
    @sales = Purchase.where(created_at: start_date..end_date)
    authorize @sales
    
  end 

  private
  def purchase_params
    params.require(:purchase).permit(product_ids:[])
  end
  
  def format_date_string(date)
    DateTime.parse(params[:purchases]["#{date}(1i)"] + '-' + params[:purchases]["#{date}(2i)"] + '-' + params[:purchases]["#{date}(3i)"] + ' ' + params[:purchases]["#{date}(4i)"] + ":" + params[:purchases]["#{date}(5i)"])
  end
end