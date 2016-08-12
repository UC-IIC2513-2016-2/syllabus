require "#{File.dirname(__FILE__)}/db_conn.rb"

class User < ActiveRecord::Base

end
User.destroy_all
user = User.new(id: 1, name: "Raúl", email: "donotspamme@example.org")
user.save
user = User.create(id: 2, name: "Benjamín", email: "donotspamme2@example.org")
user = User.new(id: 3, name: "Jon Snow", email: "lordcommander@nightswatch.org")
user.save

users = User.where(email: 'lordcommander@nightswatch.org')
users = User.where("email LIKE '%donot%'")

users.each do |user|
  puts "#{user.name} con correo #{user.email}"
end
