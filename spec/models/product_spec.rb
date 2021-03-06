require 'rails_helper'

RSpec.describe Product, type: :model do
  

  describe 'Validations' do
    category = Category.new({name: "Apparel"})
    subject{
      described_class.new(name: "backpack",
                          price: 5000,
                          quantity: 25,
                          category: category
      )
    }
    it "is valid with valid attributes and saves" do
      product = subject.save
      expect(subject).to be_valid
      expect(product).to eq(true)
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")

    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end


    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end


    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  end
end