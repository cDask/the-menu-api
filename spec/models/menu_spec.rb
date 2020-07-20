require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:restaurant) { Restaurant.new }
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
  end
end
