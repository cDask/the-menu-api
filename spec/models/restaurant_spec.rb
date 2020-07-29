require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:user) { User.new }
  let(:contact_infos) { ContactInfo.new }
  let(:menus) { Menu.new }
  let(:theme) { Theme.new }
  let(:style) { Style.new }
  subject {described_class.new(
    name: 'Name',
    subdomain: 'Subdomain',
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
# TO DO FIX ME - weird rspec behaviour
    # it 'should use the restaurants name to make a subdomain' do
    #   subject.subdomain = nil
    #   expect(subject).to eql("name")
    # end

    # it 'should format subdomain correctly' do 
    #   expect(subject).to be_valid
    #   expect(subject.subdomain).to eql("subdomain")
    # end

    it 'is not valid without opening hours' do
      subject.opening_hours = nil
      expect(subject).to_not be_valid
    end

    it 'opening hours is json format' do
      subject.opening_hours = 'hello'
      expect(subject).to_not be_valid
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
      expect(relation.macro).to eql(:has_one)
    end
  end
end


# Shoulda Matches Tests
RSpec.describe Restaurant, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    let(:user) {User.create(email:"test@user", full_name: "test", password_digest: "password")}
    subject { Restaurant.create(user: user) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:subdomain) }
  end
end
