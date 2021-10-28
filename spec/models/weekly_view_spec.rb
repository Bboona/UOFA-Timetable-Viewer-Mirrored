require 'rails_helper'

RSpec.describe Student, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is not valid with no attributes" do
    @user = Student.new(first_name: "aa",last_name:"bb", password: "123456")
    expect(@user).to be_valid
  end
  it 'is invalid without a password' do
    expect(Teacher.new(password: nil)).to_not be_valid
  end
end
