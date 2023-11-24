require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Name has to be present to be valid' do
    expect(User.new(name: '', email: 'example@example.com', password: 'password')).to_not be_valid
  end

  it 'Email has to be present to be valid' do
    expect(User.new(name: 'Carl', email: '', password: 'password')).to_not be_valid
  end

  it 'Password has to be present to be valid' do
    expect(User.new(name: 'Carl', email: 'example@example.com', password: '')).to_not be_valid
  end
end
