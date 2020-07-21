require 'rails_helper'

RSpec.describe User, type: :model do
  let(:restaurants) { Restaurant.new }
  subject { described_class.new(
    email: 'user@test.com',
    password_digest: 'password',
    full_name: 'Test User'
  )}
  
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without password' do
      subject.password_digest = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without name' do
      subject.full_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a password less than 8 characters' do
      subject.password_digest = '1234'
      expect(subject).to_not be_valid
    end

    it 'is valid with a password 8 characters or longer' do
      subject.password_digest = '12345678'
      expect(subject).to be_valid
    end

    it 'is not valid without a proper email' do
      subject.email = 'hello'
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it 'has many a restaurants' do
      relation = User.reflect_on_association(:restaurants)
      expect(relation.macro).to eql(:has_many)
    end
  end
end
