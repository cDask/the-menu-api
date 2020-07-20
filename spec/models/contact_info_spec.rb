require 'rails_helper'

RSpec.describe ContactInfo, type: :model do
  subject {described_class.new(
    name: 'Phone Number',
    info_type: 'phone number',
    info: "69696969669"
  )}
  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without name' do 
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without iNfO tYpE' do 
      subject.info_type = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without info' do 
      subject.info = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with any type except for link, other....' do
      subject.info_type = "test"
      expect(subject).to_not be_valid
    end 

  end
end
