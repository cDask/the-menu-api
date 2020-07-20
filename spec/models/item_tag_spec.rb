require 'rails_helper'

RSpec.describe ItemTag, type: :model do
  subject {  described_class.new(
    primary: true
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
end
