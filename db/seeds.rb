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
#Activity.create(class_name:"Computer Systems - LECTURE",class_code:"15000",colour:"red",description:"COMP_SCI_2000",weeks:"999168",days:"1",hours:"3145728",Hamming_Weight:"2")


activities = [
  ["Computer Systems", "COMP SCI", "2000", "12577", "LE01", "300", "98", "FF0000", "S1", "32575", "2", "786432", "MyUni/OL/Online Class", "13"],
  ["Computer Systems", "COMP SCI", "2000", "12587", "WR06", "54", "3", "FF0000", "S1", "10794", "8", "50331648", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "12588", "WR05", "48", "8", "FF0000", "S1", "10794", "8", "12582912", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "12589", "WR04", "41", "0", "FF0000", "S1", "10794", "8", "3145728", "Ingkarni Wardli/B23/CAT Suite", "6"]
    ]

activities.each do |class_name, subject, class_code, class_nbr, class_type, size, available, colour, term, weeks, days, hours, location, hamming_weight|
  Activity.create(:class_name => class_name, :subject => subject, :class_code => class_code, :class_nbr => class_nbr, :class_type => class_type,
                :size => size, :available => available, :colour => colour, :term => term, :weeks => weeks, :days => days,
                :hours => hours, :location => location, :hamming_weight => hamming_weight)
end


#--------------------------------Students START HERE--------------------------------
student_list = [
  ["a1231230"],["a1231231"],["a1231232"],["a1231233"],["a1231234"],["a1231235"],["a1231236"],["a1231237"],["a1231238"],["a1231239"]
    ]

student_list.each do |uni_id|
  Student.create(:uni_id => uni_id)
end

##SLAP ENROLMENT LIST HERE add more
student_enrolment = [
  [1, 1], [1,2], [2,1], [2,3], [3,1], [3,2], [4,1]
    ]

"""student_enrolment.each do |student_id, activity_id|
  ActivitiesStudents.create(:student_id => student_id, :activity_id => activity_id)
end"""

#--------------------------------Students END HERE--------------------------------
#--------------------------------Teachers START HERE--------------------------------
          # Example Teacher
          #Teacher.create(uni_id:"a1674564",first_name:"Aufeef",last_name:"Chauhan")

          # Example Teacher - Activity join
          #ActivitiesTeachers.create(teacher_id:1,activity_id:1)

#teacher creation
teacher_list = [
  ["a1674564","Aufeef","Chauhan"],["a1670000","Madonna","Croutons"],["a1670001","Kylie","Dessert"],
  ["a1670002","Billie","Angelcake"],["a1670003","Nicki","Hickory"],["a1670004","Delta","Goodforyou"]
    ]

teacher_list.each do |uni_id, first_name, last_name|
  Teacher.create(:uni_id => uni_id, :first_name => first_name, :last_name => last_name)
end

#teacher enrolment
teacher_enrolment = [
  [1,1],[1,2],[1,3],[1,4]
    ]

teacher_enrolment.each do |teacher_id, activity_id|
  ActivitiesTeachers.create(:teacher_id => teacher_id, :activity_id => activity_id)
end
#--------------------------------Teachers END HERE--------------------------------