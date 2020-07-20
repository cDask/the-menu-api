require 'rails_helper'

RSpec.describe Item, type: :model do
  subject {described_class.new(
    name: 'Bob Berry Blast',
    description: "Its delicious"
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
end
