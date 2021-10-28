require 'rails_helper'

RSpec.describe Student, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'is invalid without a first_name' do
    expect(Student.new(first_name: nil)).to_not be_valid
  end
  it 'is invalid without a last_name' do
    expect(Student.new(last_name: nil)).to_not be_valid
  end
  it 'is invalid without a password' do
    expect(Student.new(password: nil)).to_not be_valid
  end
  it "is not valid with no attributes" do
    @student = Student.new()
    expect(@student).not_to be_valid
  end
  it "is valid with all attributes" do
    @user = Student.new(first_name: "aa",last_name:"bb", password: "123456")
    expect(@user).to be_valid
  end
end
