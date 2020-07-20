require 'rails_helper'

RSpec.describe ItemTag, type: :model do
  let(:item) { Item.new }
  let(:tag) { Tag.new }
  subject {  described_class.new(
    primary: true,
    item: item,
    tag: tag
  )}
  
  context 'validations' do
    
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without primary value' do
      subject.primary = nil
      expect(subject).to_not be_valid
    end
    
    it 'should default primary to false' do
        non_primary_tag = ItemTag.new()
        expect(non_primary_tag.primary).to eq false
    end 
  end

  context 'associations' do
    it 'belongs to a item' do
      relation = ItemTag.reflect_on_association(:item)
      expect(relation.macro).to eql(:belongs_to)
    end

    it 'belong to a tag' do
      relation = ItemTag.reflect_on_association(:tag)
      expect(relation.macro).to eql(:belongs_to)
    end

  end
end
