class Admin::CategoriesController < Admin::ApplicationController
  before_filter :require_admin_login

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id]}
  end

  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice]= 'Category was successfully create'
      redirect_to admin_categories_path
    else
      flash[:error]= 'Category was failed to create'
      render "new"
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id]}
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice]= "Category was succsessfully update"
      redirect_to admin_categories_path
    else
      flash[:error]="Category was failed to update"
      redirect_to admin_categories_path
    end
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.destroy
    flash[:notice]= "Category was deleted"
    redirect_to admin_categories_path
  end

end
