class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :delete]


end
