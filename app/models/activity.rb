class Activity < PsoftDbBase
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :students
end
