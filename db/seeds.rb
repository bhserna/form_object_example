# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

(1..5).to_a.each do |i|
  account = Account.create(name: "Account #{i}")

  # inflows
  [5, 4, 3].each do |days|
    account.transactions.create(
      date: days.days.ago,
      payer_name: FFaker::Name.name,
      description: FFaker::Lorem.phrase,
      amount: 1_000
    )
  end
end
