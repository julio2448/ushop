puts "Creating 10 users"
10.times do |n|
  User.create(email: "user#{n}@gmail.com", password: "123456")
end
puts "10 Users created"

puts "Creating 20 coupons"
20.times do
  Coupon.create!(
    availibility: true,
    title: Faker::Job.title,
    start_time: Faker::Date.between(from: 2.days.ago, to: Date.today),
    end_time: Faker::Date.between(from: 2.days.ago, to: Date.today),
    product_name: Faker::Job.title,
    product_description: Faker::Job.title,
    code: Faker::Job.title,
    owner: User.all.sample
  )
end
puts "20 Coupons created"

puts "Creating 30 bookmarks"
30.times do
  Bookmark.create!(
    client: User.all.sample,
    coupon: Coupon.all.sample
  )
end
puts "20 boomarks created"
