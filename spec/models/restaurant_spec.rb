require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:user) { User.new }
  let(:contact_infos) { ContactInfo.new }
  let(:menus) { Menu.new }
  let(:theme) { Theme.new }
  let(:style) { Style.new }
  subject {described_class.new(
    name: 'Jacked Juice',
    subdomain: 'jackedjuice',
    opening_hours: "{'monday':[1100, 1300]}",
    user: user
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
        opening_hours: "{'monday':[1100, 1300]}",
        user: user
      )
      expect(subject2).to_not be_valid
    end
  end

  context 'associations' do
    it 'has an owner' do
      relation = Restaurant.reflect_on_association(:user)
      expect(relation.macro).to eql(:belongs_to)
    end

    it 'has much contact info' do 
      relation = Restaurant.reflect_on_association(:contact_infos)
      expect(relation.macro).to eql(:has_many)
    end

    it 'has many menus' do 
      relation = Restaurant.reflect_on_association(:menus)
      expect(relation.macro).to eql(:has_many)
    end

    it 'has one theme' do
      relation = Restaurant.reflect_on_association(:theme)
      expect(relation.macro).to eql(:has_one)
    end

    it 'has many styles' do
      relation = Restaurant.reflect_on_association(:style)
      expect(relation.macro).to eql(:has_many)
    end
  end
end
