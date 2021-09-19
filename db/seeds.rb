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
  #Activity.create(class_name:"Computer Systems - LECTURE",class_code:"15000",colour:"red",description:"COMP_SCI_2000",weeks:"999168",days:"1",hours:"3145728",hamming_weight:"2")

activities = [
  # 1-7
  ["Computer Systems", "COMP SCI", "2000", "12577", "LE01", "300", "98", "FF0000", "S1", "32575", "2", "786432", "MyUni/OL/Online Class", "13"],
  ["Computer Systems", "COMP SCI", "2000", "12587", "WR06", "54", "3", "FF0000", "S1", "10794", "8", "50331648", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "12588", "WR05", "48", "8", "FF0000", "S1", "10794", "8", "12582912", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "12589", "WR04", "41", "0", "FF0000", "S1", "10794", "8", "3145728", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "12590", "WR03", "50", "0", "FF0000", "S1", "10794", "4", "50331648", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "12591", "WR02", "31", "2", "FF0000", "S1", "10794", "4", "12582912", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "12592", "WR01", "41", "0", "FF0000", "S1", "10794", "4", "3145728", "Ingkarni Wardli/B23/CAT Suite", "6"],
  
  #8-13
  ["Computer Systems", "COMP SCI", "2000", "22707", "LE01", "405", "48", "FF0000", "S2", "31999", "2", "786432", "MyUni/OL/Online Class", "13"],
  ["Computer Systems", "COMP SCI", "2000", "22722", "WR01", "58", "11", "FF0000", "S2", "10410", "4", "3145728", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "22721", "WR02", "55", "12", "FF0000", "S2", "10410", "4", "12582912", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "22720", "WR03", "65", "35", "FF0000", "S2", "10410", "4", "50331648", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "22719", "WR04", "65", "4", "FF0000", "S2", "10410", "8", "3145728", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Computer Systems", "COMP SCI", "2000", "22718", "WR05", "60", "2", "FF0000", "S2", "10410", "8", "12582912", "Ingkarni Wardli/B23/CAT Suite", "6"],
  

  #14-18
  ["Systems Programming", "COMP SCI", "2005", "12604", "LE01", "170", "58", "FFC107", "S1", "32575", "2", "786432", "MyUni/OL/Online Class", "13"],
  ["Systems Programming", "COMP SCI", "2005", "12599", "WR01", "28", "5", "FFC107", "S1", "10794", "2", "201326592", "Ingkarni Wardli/236/CAT Suite", "6"],
  ["Systems Programming", "COMP SCI", "2005", "12598", "WR02", "24", "13", "FFC107", "S1", "10794", "2", "12582912", "Ingkarni Wardli/236/CAT Suite", "6"],
  ["Systems Programming", "COMP SCI", "2005", "12597", "WR03", "28", "9", "FFC107", "S1", "10794", "16", "3221225472", "MyUni/OL/Online Class", "6"],
  ["Systems Programming", "COMP SCI", "2005", "12596", "WR04", "30", "27", "FFC107", "S1", "10794", "4", "786432", "Ingkarni Wardli/B15/CAT Suite", "6"],
  

  #19-23
  ["Operating Systems", "COMP SCI", "3004", "24936", "LE01", "350", "37", "004D40", "S2", "31999", "8", "4026531840", "MyUni/OL/Online Class", "13"],
  ["Operating Systems", "COMP SCI", "3004", "24947", "WR01", "40", "10", "004D40", "S2", "31992", "1", "3145728", "Engineering & Mathematics/EMG06/Teaching Room", "10"],
  ["Operating Systems", "COMP SCI", "3004", "24945", "WR03", "40", "14", "004D40", "S2", "31992", "2", "12582912", "Engineering & Mathematics/EMG07/Teaching Room", "10"],
  ["Operating Systems", "COMP SCI", "3004", "24943", "WR05", "40", "10", "004D40", "S2", "31992", "2", "251658240", "Barr Smith South/2052/Teaching Room", "10"],
  ["Operating Systems", "COMP SCI", "3004", "24941", "WR07", "40", "4", "004D40", "S2", "31992", "4", "3145728", "Engineering & Mathematics/EMG06/Teaching Room", "10"],
  

  #24-30
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "12606", "LE01", "400", "28", "D8941B", "S1", "16191", "3", "805306368", "MyUni/OL/Online Class", "12"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "12627", "PR01", "37", "2", "D8941B", "S1", "5396", "2", "15728640", "Ingkarni Wardli/B16/CAT Suite", "5"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "12626", "PR02", "37", "11", "D8941B", "S1", "5396", "16", "4026531840", "Ingkarni Wardli/B16/CAT Suite", "5"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "12625", "PR03", "40", "2", "D8941B", "S1", "5396", "4", "16106127360", "MyUni/OL/Online Class", "5"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "12617", "WR01", "33", "0", "D8941B", "S1", "10794", "2", "50331648", "Engineering & Mathematics/EMG07/Teaching Room", "6"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "12616", "WR02", "33", "0", "D8941B", "S1", "10794", "4", "3145728", "Engineering & Mathematics/EMG07/Teaching Room", "6"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "12615", "WR03", "30", "0", "D8941B", "S1", "10794", "4", "51539607552", "MyUni/OL/Online Class", "6"],
  

  #31-39
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22724", "LE01", "244", "36", "D8941B", "S2", "15615", "20", "786432", "Physics/103/Kerr Grant Lecture Theatre", "12"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22731", "PR01", "38", "4", "D8941B", "S2", "5204", "8", "16106127360", "Ingkarni Wardli/B23/CAT Suite", "5"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22730", "PR02", "38", "8", "D8941B", "S2", "5204", "4", "16106127360", "Ingkarni Wardli/B15/CAT Suite", "5"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22729", "PR03", "60", "0", "D8941B", "S2", "5204", "8", "1006632960", "MyUni/OL/Online Class", "5"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22738", "WR01", "33", "11", "D8941B", "S2", "10410", "2", "786432", "Engineering & Mathematics/EMG07/Teaching Room", "6"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22736", "WR03", "60", "0", "D8941B", "S2", "10410", "2", "201326592", "MyUni/OL/Online Class", "6"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22735", "WR04", "30", "0", "D8941B", "S2", "10410", "1", "805306368", "Barr Smith South/2051/Teaching Room", "6"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22734", "WR05", "30", "3", "D8941B", "S2", "10410", "2", "805306368", "Engineering & Mathematics/EM218/Teaching Room", "6"],
  ["Algorithm Design & Data Structures", "COMP SCI", "2103", "22733", "WR06", "30", "1", "D8941B", "S2", "10410", "1", "201326592", "Barr Smith South/2051/Teaching Room", "6"],
  
  #40-44
  ["Mathematics IA", "MATHS", "1011", "12224", "LE01", "935", "136", "D81B60", "S1", "32575", "16", "805306368", "MyUni/OL/Online Class", "13"],
  ["Mathematics IA", "MATHS", "1011", "15423", "TU01", "55", "12", "D81B60", "S1", "32575", "4", "201326592", "Badger/G31/Macbeth Lecture Theatre", "13"],
  ["Mathematics IA", "MATHS", "1011", "15422", "TU02", "55", "8", "D81B60", "S1", "32575", "2", "3145728", "Engineering Sth/S112/Teaching Room", "13"],
  ["Mathematics IA", "MATHS", "1011", "15421", "TU03", "55", "7", "D81B60", "S1", "32575", "16", "12582912", "Engineering Sth/S112/Teaching Room", "13"],
  ["Mathematics IA", "MATHS", "1011", "15420", "TU04", "55", "8", "D81B60", "S1", "32575", "8", "12582912", "Engineering Sth/S112/Teaching Room", "13"],
  
  #45-49
  ["Mathematics IB", "MATHS", "1012", "24873", "LE01", "700", "127", "D81B60", "S2", "31999", "16", "3221225472", "The Braggs/G60/Bragg Lecture Theatre", "13"],
  ["Mathematics IB", "MATHS", "1012", "25424", "TU01", "55", "4", "D81B60", "S2", "31999", "2", "3145728", "Barr Smith South/2060/Teaching Room", "13"],
  ["Mathematics IB", "MATHS", "1012", "25423", "TU02", "55", "8", "D81B60", "S2", "31999", "4", "3145728", "Barr Smith South/1062/Teaching Room", "13"],
  ["Mathematics IB", "MATHS", "1012", "25422", "TU03", "55", "9", "D81B60", "S2", "31999", "16", "12884901888", "Barr Smith South/1062/Teaching Room", "13"],
  ["Mathematics IB", "MATHS", "1012", "25421", "TU04", "55", "4", "D81B60", "S2", "31999", "4", "12582912", "Barr Smith South/2060/Teaching Room", "13"],
  
  #50-51
  ["Ethics and Data Management I", "APP DATA", "1010", "11956", "LE01", "50", "23", "1E88E5", "S1", "32575", "4", "3145728", "MyUni/OL/Online Class", "13"],
  ["Ethics and Data Management I", "APP DATA", "1010", "11957", "WR01", "50", "23", "1E88E5", "S1", "10794", "2", "17112760320", "Horace Lamb/422/Teaching Room", "6"],
  
  #52-53
  ["Ethics and Data Management I", "APP DATA", "1010", "29625", "LE01", "50", "0", "1E88E5", "S2", "31999", "1", "51539607552", "MyUni/OL/Online Class", "13"],
  ["Ethics and Data Management I", "APP DATA", "1010", "29626", "WR01", "50", "1", "1E88E5", "S2", "10410", "2", "4380866641920", "Horace Lamb/422/Teaching Room", "6"],
  
  #54-59
  ["Materials & Manufacturing", "MECH ENG", "2020", "10728", "LE01", "200", "68", "6352E2", "S1", "32575", "8", "15728640", "Helen Mayo Nth/103N/Florey Lecture Theatre", "13"],
  ["Materials & Manufacturing", "MECH ENG", "2020", "10733", "TU01", "40", "8", "6352E2", "S1", "16191", "4", "786432", "Engineering Sth/S111/Teaching Room", "12"],
  ["Materials & Manufacturing", "MECH ENG", "2020", "10732", "TU02", "40", "17", "6352E2", "S1", "16191", "2", "786432", "Engineering Sth/S112/Teaching Room", "12"],
  ["Materials & Manufacturing", "MECH ENG", "2020", "10731", "TU03", "40", "10", "6352E2", "S1", "16191", "4", "805306368", "Engineering Sth/S112/Teaching Room", "12"],
  ["Materials & Manufacturing", "MECH ENG", "2020", "10730", "TU04", "40", "32", "6352E2", "S1", "16191", "2", "50331648", "Engineering Sth/S111/Teaching Room", "12"],
  ["Materials & Manufacturing", "MECH ENG", "2020", "10729", "TU05", "40", "1", "6352E2", "S1", "16191", "2", "12582912", "Engineering Sth/S111/Teaching Room", "12"],
  
  #60-62
  ["Introduction to Mining Engineering I", "MINING", "1011", "23999", "LE01", "25", "7", "F54681", "S2", "15615", "2", "62914560", "MyUni/OL/Online Class", "12"],
  ["Introduction to Mining Engineering I", "MINING", "1011", "24000", "PJ01", "25", "7", "F54681", "S2", "15615", "4", "12582912", "Ingkarni Wardli/236/CAT Suite", "12"],
  ["Introduction to Mining Engineering I", "MINING", "1011", "24001", "TU01", "25", "7", "F54681", "S2", "15615", "4", "201326592", "Engineering & Mathematics/EMG07/Teaching Room", "12"],
  
  #63-64
  ["Industry Internship II", "ARTS", "2201", "10917", "SG01", "15", "5", "088C7A", "S1", "16191", "4", "64424509440", "Napier/102/Lecture Theatre", "12"],
  ["Industry Internship II", "ARTS", "2201", "21544", "SG01", "20", "3", "088C7A", "S2", "15615", "8", "4026531840", "Lower Napier/LG28/Lecture Theatre", "12"],

  #65-68
  ["Corporate Accounting", "ACCTING", "3501", "18605", "LE01", "227", "2", "9CF354", "S1", "32575", "4", "62914560", "MyUni/OL/Online Class", "13"],
  ["Corporate Accounting", "ACCTING", "3501", "13105", "WR02", "25", "0", "9CF354", "S1", "1852", "8", "786432", "Barr Smith South/2040/Teaching Room", "7"],
  ["Corporate Accounting", "ACCTING", "3501", "13104", "WR03", "25", "0", "9CF354", "S1", "1852", "4", "3221225472", "MyUni/OL/Online Class", "7"],
  ["Corporate Accounting", "ACCTING", "3501", "13101", "WR06", "25", "0", "9CF354", "S1", "1852", "2", "201326592", "Nexus10/UB34/Teaching Room", "7"],

  #69-81
  ["Mathematics for Data Science I", "MATHS", "1004", "24034", "LE01", "260", "41", "EA8DAC", "S2", "15615", "4", "786432", "Napier/G04/Lecture Theature", "12"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24041", "TU01", "55", "27", "EA8DAC", "S2", "10410", "2", "51539607552", "Engineering & Mathematics/EM205/Teaching Room", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24040", "TU02", "55", "47", "EA8DAC", "S2", "10410", "2", "786432", "Engineering & Mathematics/EM205/Teaching Room", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24039", "TU03", "55", "23", "EA8DAC", "S2", "10410", "16", "786432", "Engineering & Mathematics/EM205/Teaching Room", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24038", "TU04", "55", "16", "EA8DAC", "S2", "10410", "2", "3221225472", "Barr Smith South/1063/Teaching Room", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24037", "TU05", "55", "3", "EA8DAC", "S2", "10410", "2", "805306368", "Barr Smith South/1063/Teaching Room", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24036", "TU06", "55", "0", "EA8DAC", "S2", "10410", "1", "12582912", "MyUni/OL/Online Class", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24047", "CO01", "40", "11", "EA8DAC", "S2", "5205", "8", "786432", "Engineering & Mathematics/EMG13/Computer Suite", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24046", "CO02", "45", "1", "EA8DAC", "S2", "5205", "4", "50331648", "Engineering & Mathematics/EM108/CAT Suite", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24045", "CO03", "40", "5", "EA8DAC", "S2", "5205", "2", "3145728", "Ingkarni Wardli/B23/CAT Suite", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24044", "CO04", "25", "2", "EA8DAC", "S2", "5205", "4", "3221225472", "MyUni/OL/Online Class", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24043", "CO05", "45", "0", "EA8DAC", "S2", "5205", "2", "12582912", "Ingkarni Wardli/234/CAT Suite", "6"],
  ["Mathematics for Data Science I", "MATHS", "1004", "24042", "CO06", "40", "0", "EA8DAC", "S2", "5205", "16", "50331648", "MyUni/OL/Online Class", "6"]

    ]

activities.each do |class_name, subject, class_code, class_nbr, class_type, size, available, colour, term, weeks, days, hours, location, hamming_weight|
  Activity.create(:class_name => class_name, :subject => subject, :class_code => class_code, :class_nbr => class_nbr, :class_type => class_type,
                :size => size, :available => available, :colour => colour, :term => term, :weeks => weeks, :days => days,
                :hours => hours, :location => location, :hamming_weight => hamming_weight)
end


#--------------------------------Students START HERE--------------------------------
student_list = [
  ["a1231230","Rosalie","Matthews","fishinghook"],["a1231231","Rudi","Higgs","bagofpopcorn"],
  ["a1231232","Ursula","Kay","handheldgamesystem"],["a1231233","Bethaney","Mcmanus","thimble"],
  ["a1231234","Siya","Beaumont","saltshaker"],["a1231235","Marta","Huerta","dominoset"],
  ["a1231236","Alfie","Parsons","stickynote"],["a1231237","Skye","Holloway","sandal"],
  ["a1231238","Regina","Riley","plushfrog"],["a1231239","Teddy","Coles","washcloth"],
  ["a1231240","Jade","Espinoza","coffeemug"],["a1231241","Shane","Betts","tennisracket"],
  ["a1231242","Ainsley","Haney","matchbook"],["a1231243","Franky","Colley","crowbar"],
  ["a1231244","Ariel","Richard","pocketwatch"],["a1231245","Marley","Boyle","candycane"],
  ["a1231246","Eliot","Huerta","icecube"],["a1231247","Callan","Henderson","wineglass"],
  ["a1231248","Farah","Neville","woodenspoon"],["a1231249","Kaiden","Vaughn","helmet"],
  ["a1231250","Frances","Lindsay","acorn"]
    ]

student_list.each do |uni_id,first_name,last_name,password|
  Student.create(:uni_id => uni_id,:first_name => first_name,:last_name => last_name,:password => password)
end


student_enrolment = [
  #rosalie
  [1,1],[1,2],[1,40],[1,42],[1,14],[1,18],[1,24],[1,25],[1,28],[1,45],[1,46],[1,52],[1,53],[1,60],[1,61],[1,62],[1,64],

  #rudi
  [2,1], [2,4],[2,65],[2,66],[2,40],[2,42],[2,54],[2,58],[2,69],[2,74],[2,80],[2,52],[2,53],[2,60],[2,61],[2,62],[2,31],
  [2,33],[2,38],

  #ursula
  [3,1], [3,8],[3,50],[3,51],[3,54],[3,56],[3,63],[3,31],[3,32],[3,35],[3,19],[3,20],[3,45],[3,48],[3,69],[3,71],[3,77],

  #bethaney
  [4,1],[4,3],[4,14],[4,18],[4,65],[4,68],[4,54],[4,56],[4,19],[4,23],[4,60],[4,61],[4,62],[4,64],[4,65],[4,73],[4,80],

  #siya
  [5,1],[5,3],[5,24],[5,25],[5,28],[5,50],[5,51],[5,54],[5,56],[5,19],[5,21],[5,45],[5,46],[5,52],[5,53],[5,69],[5,73],[5,80],

  #marta
  [6,1]
  #alfie
  #skye
  #regina
  #teddy
  #jade
  #shane
  #ainsley
  #franky
  #ariel
  #marley
  #eliot
  #callan
  #farah
  #kaiden
  #frances
    ]

student_enrolment.each do |student_id, activity_id|
  ActivitiesStudents.create(:student_id => student_id, :activity_id => activity_id)
end

#--------------------------------Students END HERE--------------------------------
#--------------------------------Teachers START HERE--------------------------------
          # Example Teacher
          #Teacher.create(uni_id:"a1674564",first_name:"Aufeef",last_name:"Chauhan")

          # Example Teacher - Activity join
          #ActivitiesTeachers.create(teacher_id:1,activity_id:1)

#teacher creation
teacher_list = [
  ["a1674564","Aufeef","Chauhan","gradualideology"],["a1670000","Madonna","Croutons","springnationalism"],
  ["a1670001","Kylie","Dessert","extractimplication"],["a1670002","Billie","Angelcake","reformexpectation"],
  ["a1670003","Nicki","Hickory","guardheaven"],["a1670004","Delta","Selby","definiteillusion"]
    ]

teacher_list.each do |uni_id,first_name,last_name,password|
  Teacher.create(:uni_id => uni_id,:first_name => first_name,:last_name => last_name,:password => password)
end

#teacher enrolment
teacher_enrolment = [
  #aufeef
  [1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9],[1,10],[1,11],[1,12],[1,13],

  #madonna
  [2,14],[2,15],[2,16],[2,17],[2,18],[2,19],[2,20],[2,21],[2,22],[2,23],

  #kylie
  [3,24],[3,25],[3,26],[3,27],[3,28],[3,29],[3,30],[3,31],[3,32],[3,33],[3,34],[3,35],[3,36],[3,37],[3,38],[3,39],

  #billie
  [4,40],[4,41],[4,42],[4,43],[4,44],[4,45],[4,46],[4,47],[4,48],[4,49],

  #nicki
  [5,50],[5,51],[5,52],[5,53],[5,54],[5,55],[5,56],[5,57],[5,58],[5,59],[5,60],[5,61],[5,62],

  #delta
  [6,63],[6,64],[6,65],[6,66],[6,67],[6,68],[6,69],[6,70],[6,71],[6,72],[6,73],[6,74],[6,75],[6,76],[6,77],[6,78],[6,79],
  [6,80],[6,81]
    ]

teacher_enrolment.each do |teacher_id, activity_id|
  ActivitiesTeachers.create(:teacher_id => teacher_id, :activity_id => activity_id)
end
#--------------------------------Teachers END HERE--------------------------------
#--------------------------------Admins START HERE--------------------------------
#admin creation
admin_list = [
  ["a1000000","Sunny","Rylan","fryingpan"],["a1000001","Uladzimir","Sunita","postagestamp"],
  ["a1000002","Melania","Hani","umbrella"],["a1000003","Lilo","Emilio","miniatureportrait"],
  ["a1000004","Toni","Judith","streetlights"]
    ]

admin_list.each do |uni_id,first_name,last_name,password|
  Admin.create(:uni_id => uni_id,:first_name => first_name,:last_name => last_name,:password => password)
end
#--------------------------------Admins END HERE--------------------------------