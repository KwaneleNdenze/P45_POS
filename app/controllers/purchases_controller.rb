class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
    @products = Product.all
  end

  def show
    
  end

  def new
    @purchase = Purchase.new
    authorize @purchase
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end