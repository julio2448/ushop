puts "Creating 10 users"
10.times do |n|
  User.create(email: "user#{n}@gmail.com", password: "123456", role: ["business", "customer"].sample)
end
puts "10 Users created"

# users = User.all
# customers = []
# owners = []

# users.each do |user|
#   if user.customer?
#     customers << user
#   else
#     owners << user
#   end
# end

puts "Creating 20 coupons"
20.times do
  Coupon.create!(
    title: Faker::Job.title,
    start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
    end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
    product_name: Faker::Job.title,
    product_description: Faker::Job.title,
    code: Faker::Code.nric,
    owner: User.owners.sample
  )
end
puts "20 Coupons created"


puts "Creating 30 bookmarks"
30.times do
  Bookmark.create!(
    client: User.customers.sample,
    coupon: Coupon.all.sample
  )
end
puts "20 boomarks created"
