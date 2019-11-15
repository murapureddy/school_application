# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

school = School.create(name: 'Tech Affinity')

school = School.first
teacher = Teacher.new(firstname: 'Principal', email: 'principal@tech.com', password: 'principal@123',role: 'admin',school_id: school.id)
teacher.save

subject = Subject.create(sub_name: 'English', sub_code: 001)
subject = Subject.create(sub_name: 'Tamil', sub_code: 002)

student = Student.create(name: 'Akhil', standard: '10th')
