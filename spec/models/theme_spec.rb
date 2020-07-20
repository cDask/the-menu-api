require 'rails_helper'

RSpec.describe Theme, type: :model do
  let(:item) { Item.new }
  subject { described_class.new(
    theme_class: 'menu-class-1',
    item: item
  )}

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a theme class' do
      subject.theme_class = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it 'belongs to anything' do
      relation = Theme.reflect_on_association(:item)
      expect(relation.macro).to eql(:belongs_to)
    end
  end
end
