# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# initialise a restrictionlevel object (required for server to run)
RestrictionLevel.create( level_current: 0, level_name: "0")

# create 52 - 9 weekly objects
i=256 # start at 256, as that is week 9
while i <= 2**52
  Weekly.create(week: i.to_s)
  i = i * 2
end

# Example Class Activity
Activity.create(class_name:"Computer Systems - LECTURE",class_code:"15000",colour:"red",description:"COMP_SCI_2000",weeks:"999168",days:"1",hours:"3145728",Hamming_Weight:"2")

# Example Teacher
Teacher.create(uni_id:"a1674564",first_name:"Aufeef",last_name:"Chauhan")

# Example Teacher - Activity join
ActivitiesTeachers.create(teacher_id:1,activity_id:1)