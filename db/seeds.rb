# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Company.create(company_name: 'ACME CO.')
Company.create(company_name: 'Wayne Industries')

Department.create(department_name: 'ACME Department', company: Company.first)
Department.create(department_name: 'Wayne Department', company: Company.second)




# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
