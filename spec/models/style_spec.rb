require 'rails_helper'

RSpec.describe Style, type: :model do
  let(:item) { Item.new }
  subject { described_class.new(
    style_data: '{background-colour: #FFFFFF}',
    styleable: item
  )}

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a style_data' do
      subject.style_data = nil
      expect(subject).to_not be_valid
    end

    it 'style data is json format' do
      subject.style_data = 'hello'
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it { should belong_to(:styleable) }
  end

end
