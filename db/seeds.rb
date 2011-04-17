# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

p_user = {
  :login => 'admin', :email => 'admin@chucklee.me', :password => '123123',
  :password_confirmation => '123123'
}
user = User.create(p_user)
