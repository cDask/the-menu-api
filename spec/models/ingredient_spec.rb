require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:item) { Item.new }
  subject { described_class.new(
    name: 'strawberries',
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
  end

  context 'associations' do
    it 'belongs to a item' do
      relation = Ingredient.reflect_on_association(:item)
      expect(relation.macro).to eql(:belongs_to)
    end
  end
end
