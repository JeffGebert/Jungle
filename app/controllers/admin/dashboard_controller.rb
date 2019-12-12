class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @number_products = Product.count
    @number_categories = Category.count
  end
end


