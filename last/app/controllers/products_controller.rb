class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = 'Product was successfully added'
      redirect_to products_path
    else
      flash[:error] = 'Product failed to added'
      render "new"
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @product = Product.find_by_id(params[:id])
  end
end