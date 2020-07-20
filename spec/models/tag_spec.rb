require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:item_tags) { ItemTag.new }
  let(:items) { Item.new }
  subject { described_class.new(
    name: "hoot hooot spicy"
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
    it 'has many item tags' do
      relation = Tag.reflect_on_association(:item_tags)
      expect(relation.macro).to eql(:has_many)
    end

    it 'has many items' do
      relation = Tag.reflect_on_association(:items)
      expect(relation.macro).to eql(:has_many)
    end
  end
end
