# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  User.create(
      {
        first_name: "himalayan#{i + 1}",
        last_name: "sanjeev#{i + 1}",
        address_city: "Rainas#{i + 1}",
        address_state: "Gandaki#{i + 1}",
        mobile_number: "980000000#{i + 1}",
        email: "h.sanjeev#{i + 1}@gmail.com",
        date_of_birth: Date.today - (i+1).years
      }
    )
end
end
