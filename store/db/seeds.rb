# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    users = User.create([{:first_name => "amanda", :last_name => "putri", :email => "email@yahoo.com", :username => "manda", :address => "jalan-jalan", :age => "6", :birthday => "20 december 2012"}, {:first_name=> "steve", :last_name => "jobs", :email => "email@yahoo.com", :username => "steve", :address => "jalan-jalan", :age => "6", :birthday => "20 december 2012"}, {:first_name => "joko", :last_name => "sugiarto", :email => "email@yahoo.com", :username => "joko", :address => "jalan-jalan", :age => "6", :birthday => "20 december 2012"}, {:first_name => "nicole", :last_name => "white", :email => "email@yahoo.com", :username => "nicole", :address => "jalan-jalan", :age => "6", :birthday => "20 december 2012"}, {:first_name => "bambang", :last_name => "kusumo", :email => "email@yahoo.com", :username => "bambang", :address => "jalan-jalan", :age => "6", :birthday => "20 december 2012"}])


    countries = Country.create([{:code => "codes", :name => "amanda"}, {:code => "codes", :name => "steve"}, {:code => "codes", :name => "joko"}, {:code => "codes", :name => "nicole"}, {:code => "codes", :name => "bambang"}])
  

    articles = Article.create([{:title => "untitled", :body => "texted"}, {:title => "untitled", :body => "texted"}, {:title => "untitled", :body => "texted"}, {:title => "untitled", :body => "texted"}, {:title => "untitled", :body => "texted"}])


    comments = Comment.create([{:content => "texted"}, {:content => "texted"}, {:content => "texted"}, {:content => "texted"}, {:content => "texted"}])
