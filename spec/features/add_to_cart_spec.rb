require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "they can add a a product to the cart" do
    visit root_path

    expect(page).to have_text "My Cart (0)"
    
    page.find("article.product", match: :first).find('footer').find('form').find('button', text: 'Add').click

    # puts page.html
    expect(page).to have_text 'My Cart (1)'

    save_screenshot  
  end
end
