require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject {described_class.new(
    name: 'Jacked Juice',
    subdomain: 'jackedjuice',
    opening_hours: "{'monday':[1100, 1300]}"
  )}

  context 'validations' do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it 'is not valid without name' do 
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without subdomain' do
      subject.subdomain = nil 
      expect(subject).to_not be_valid
    end

    it 'is not valid without opening hours' do
      subject.opening_hours = nil
      expect(subject).to_not be_valid
    end

    it 'opening hours is json format' do
      subject.opening_hours = 'hello'
      expect(subject).to_not be_valid
    end
    
    it 'subdomain is unique' do
      #TODO check this one
      subject2 = Restaurant.new(
        name: 'jacked juice',
        subdomain: 'jackedjuice',
        opening_hours: ''
      )
      expect(subject2).to_not be_valid
    end
  end
end
