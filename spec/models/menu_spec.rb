require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:restaurant) { Restaurant.new }
  let(:items) { Item.new }
  let(:theme) { Theme.new }
  let(:style) { Style.new }
  subject { described_class.new(
    title: 'Main Menu',
    restaurant: restaurant
  )}
  
  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it 'belongs to a restaurant' do
      relation = Menu.reflect_on_association(:restaurant)
      expect(relation.macro).to eql(:belongs_to)
    end

    it 'has many items' do
      relation = Menu.reflect_on_association(:items)
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
