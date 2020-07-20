require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject { described_class.new(
    title: 'Main Menu'
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
end
