require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it do
    attributes = attributes_for(:user)
    should permit(:email, :password, :full_name)
      .for(:create, params: {user: attributes})
      .on(:user)
  end
end
