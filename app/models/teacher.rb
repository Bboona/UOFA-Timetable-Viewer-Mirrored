class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :activities
  has_secure_password
end
