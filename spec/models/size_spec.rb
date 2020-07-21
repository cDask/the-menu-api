require 'rails_helper'

RSpec.describe Size, type: :model do
  let(:item) { Item.new }
  subject { described_class.new(
    name: "PHAT",
    price: 8000,
    item: item
  )}

  context 'validations' do 
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
    
  end

  context 'associations' do
    it 'belongs to a item' do
      relation = Size.reflect_on_association(:item)
      expect(relation.macro).to eql(:belongs_to)
    end
  end
end
