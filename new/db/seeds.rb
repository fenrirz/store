# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  users =User.create([{ :first_name => 'adi', :last_name => 'bahtiarsyah', :email => 'adi.bahti@mail.com', :username => 'adibah'}, {:first_name => 'varid', :last_name => 'kristanto', :email => "varid.k@mail.com", :username => 'varidk'}, {:first_name => 'robert', :last_name => 'maulana', :email => 'robertmau@mail.com', :username => 'robertmau'}, {:first_name => 'adrian', :last_name => 'kurniawan', :email => 'ardiank@mail.com', :username => 'ardiankur'}, {:first_name => 'agus', :last_name => 'santoso', :email => 'agussan@mail.com', :username => 'agussan'}])
