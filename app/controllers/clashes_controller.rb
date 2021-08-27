class ClashesController < ApplicationController

  def index
    # @clashes = []
    clashes = [
      ['Software Architecture', 'COMP SCI 4000', 'Lecture', '11-Aug-2021', '09:00 AM - 11:00 AM', 'a1686874'],
      ['Engineering Software as a Service', 'COMP SCI 3304', 'Practical', '13-Aug-2021', '09:00 AM - 11:00 AM', 'a1686874'],
      ['Systems Engineering and Industry Practice', 'ENG 3004', 'Project', '13-Aug-2021', '02:00 PM - 04:00 PM', 'a1686874'],
      ['Introduction to Statistical Machine Learning', 'COMP SCI 3314', 'Lecture', '11-Aug-2021', '11:00 AM - 01:00 PM', 'a1232300'],
      ['Operating Systems', 'COMP SCI 3004', 'Lecture', '12-Aug-2021', '02:00 PM - 04:00 PM', 'a1232300'],
      ['Micro-Controller Programming', 'MECH ENG 3032', 'Project', '9-Aug-2021', '09:00 AM - 11:00 AM', 'a1232300'],
    ]
    @clashes = clashes.map{ |e| { course_name: e[0], course_code: e[1], class_type: e[2], date: e[3], time: e[4], student_id: e[5] } }
    # @clashes = nil
  end
end
