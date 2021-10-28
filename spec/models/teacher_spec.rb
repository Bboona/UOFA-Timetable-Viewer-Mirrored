require 'rails_helper'

RSpec.describe Teacher, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'is invalid without a first_name' do
    expect(Teacher.new(first_name: nil)).to_not be_valid
  end
  it 'is invalid without a last_name' do
    expect(Teacher.new(last_name: nil)).to_not be_valid
  end
  it 'is invalid without a password' do
    expect(Teacher.new(password: nil)).to_not be_valid
  end
end
