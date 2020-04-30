class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["ADMIN_USERNAME"], :password => ENV["ADMIN_PASSWORD"]
  
  def show
    @category = Category.all
    @products = Product.all
  end
  helper_method :show

end
