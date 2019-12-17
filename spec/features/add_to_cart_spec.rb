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
    puts page.html
    click_on(class:'btn btn-primary', match: :first)
    sleep(1)
    have_text 'My Cart (1)'
    sleep(2)
    puts page.html
    save_screenshot 'add2cart.png'

    # VERIFY

  end
end