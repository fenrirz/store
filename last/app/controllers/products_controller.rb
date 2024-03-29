class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
    @parent_category = Category.where(["parent_id IS NOT NULL"]).map{|x| [x.name, x.id ]}
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
    @product = Product.find_by_id(params[:id])
    @child_category = Category.where(["parent_id IS NOT NULL"]).map{|x| [x.name, x.id ]}
  end

  def update
    if @product.update_attributes(params[:product])
      flash[:notice]= 'Product was successfully updated'
      redirect_to products_path
    else
      flash[:error]= 'Product was failed to update'
      render "edit"
    end
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def show
    
    @product = Product.find_by_id(params[:id])
  end
end
