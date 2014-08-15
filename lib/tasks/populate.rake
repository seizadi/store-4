namespace :db do
  desc "Erase and fill database"
  # Set Environment for Rails
  task :populate => :environment do
    # Could not get this to work as got runtime error
    # Looks like this gem not in use much and look at factory_girl
    # require 'populator'
    # To generate fake persons
    # require 'faker'
    [Order].each(&:delete_all)
    
    datetime = Time.now
       
    100.times do
      order = Order.new()
      order.price = 20.5 + Random.rand(100)
      order.shipping = (Random.rand(2) > 0) ? true : false
      order.purchased_at = datetime - Random.rand(10000000)              
      order.save
    end
    
    # Order.populate 100 do |order|
      # Order name with 10 random words
      # order.name = Populator.words(1..10).titleize
      # Order description with random 2-10 sentences
      # order.description = Populator.sentences(2..10)
      # order.price = [4.99, 19.95, 28.50, 46.25, 56.23, 99.89]
      # order.shipping = [true, false]
      # order.purchased_at = 2.years.ago..Time.now
      # order.created_at = order.purchased_at
  # end
  # For People
  # Person.populate 100 do |person|
  # person.name = Faker::Name.name
  # person.company = Faker::Company.name
  # person.email = Faker::Internet.name
  # person.phone = Faker::PhoneNumber.phone_number
  # person.street = Faker::Address.street_address
  # person.city = Faker::Address.city
  # person.name = Faker::Address.us_state_abbr
  # person.name = Faker::Address.zip_code
  # end
 end 
end