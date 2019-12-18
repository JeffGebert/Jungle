require 'rails_helper'

RSpec.feature "users can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        image: open_asset('apparel1.jpg'),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    click_link(class: 'btn btn-default pull-right', match: :first)
    sleep(1)
    save_screenshot 'productDetail.png'

    # VERIFY

  end
end
