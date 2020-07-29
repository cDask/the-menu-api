require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:menu) { Menu.new }
  let(:ingredients) { Ingredient.new }
  let(:sizes) { Size.new }
  let(:theme) { Theme.new }
  let(:style) { Style.new }
  let(:item_tags) { ItemTag.new }
  let(:tags) { Tag.new }
  subject {described_class.new(
    name: 'Bob Berry Blast',
    description: "Its delicious",
    menu: menu
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
    it 'belongs to a menu' do
      relation = Item.reflect_on_association(:menu)
      expect(relation.macro).to eql(:belongs_to)
    end

    it 'has many ingredients' do
      relation = Item.reflect_on_association(:ingredients)
      expect(relation.macro).to eql(:has_many)
    end

    it 'has many sizes' do
      relation = Item.reflect_on_association(:sizes)
      expect(relation.macro).to eql(:has_many)
    end

    it 'has many itemtags' do
      relation = Item.reflect_on_association(:item_tags)
      expect(relation.macro).to eql(:has_many)
    end

    it 'has many tags' do
      relation = Item.reflect_on_association(:tags)
      expect(relation.macro).to eql(:has_many)
    end

    it 'has one theme' do
      relation = Menu.reflect_on_association(:theme)
      expect(relation.macro).to eql(:has_one)
    end

    it 'has many styles' do
      relation = Menu.reflect_on_association(:style)
      expect(relation.macro).to eql(:has_one)
    end
  end
end
