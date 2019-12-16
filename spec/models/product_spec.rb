require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    @category = Category.new(:name => "Cars")
    let (:product) { Product.new(:name => "RDX", :price => 10000, :quantity => 1, :category => @category) }

    it 'validates a product with all four fields set will save successs' do
      product.save
      product.valid?
    end
    it 'validate name is present' do
      product.name = nil
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'validate price is present' do
      product.price_cents = nil
      product.valid?
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'validate quantity is present' do
      product.quantity = nil
      product.valid?
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'validate category is present' do
      product.category = nil
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end


