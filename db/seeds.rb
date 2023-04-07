require 'open-uri'

puts "Creating 10 users"
10.times do |n|
  User.create(email: "user#{n}@gmail.com", password: "123456", role: ["business", "customer"].sample, address: Faker::Address.full_address)
end

puts "10 Users created"

# puts "Creating 20 coupons"
# 20.times do
#   Coupon.create!(
#     title: Faker::Job.title,
#     start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
#     end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
#     product_name: Faker::Job.title,
#     product_description: Faker::Job.title,
#     code: Faker::Code.nric,
#     owner: User.owners.sample,
#     address: Faker::Address.full_address
#   )
# end
# puts "20 Coupons created"

puts " 10 real busiensses"

puts "First real business"
coupon1 = Coupon.new(
  title: "Coffee 10% Off at Tottus",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Nesco Coffee",
  product_description: "10% off Nesco Coffee",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Tottus, Av. La Fontana 790, Lima, Lima Province 15024, Peru"
)
file1 = URI.open("https://thumbs.dreamstime.com/z/coffee-coupon-discount-template-gift-voucher-label-banner-advertisement-business-vector-eps-coffee-coupon-discount-template-gift-147556425.jpg")
coupon1.photo.attach(io: file1, filename: 'coffe10.jpg', content_type: 'image/jpg')
coupon1.save!
puts "First real business created"

puts "Second real business"
coupon2 = Coupon.create!(
  title: "20% off salad products at Plaza Vea",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Salad",
  product_description: "20% off salad products only valid on Plaza Vea La Molina",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Plaza Vea, Av. La Molina 1080, Lima, Lima Province 15023, Peru"
)
file2 = URI.open("https://thumbs.dreamstime.com/z/collection-advertising-coupon-hot-deal-salad-vector-flat-illustration-horizontal-discount-flyer-set-flyers-special-offers-225864201.jpg")
coupon2.photo.attach(io: file2, filename: 'salad20.jpg', content_type: 'image/jpg')
coupon2.save!
puts "Second real business created"

puts "Third real business"
coupon3 = Coupon.create!(
  title: "25% off chicken at Tottus",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Chicken",
  product_description: "25% off chicken only valid on Tottus Molicentro",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Tottus, Molicentro, Lima, Lima Province 15026, Peru"
)
file3 = URI.open("https://smartcanucks.ca/wp-content/uploads/2021/07/f-1.jpg")
coupon3.photo.attach(io: file3, filename: 'chicken25.jpg', content_type: 'image/jpg')
coupon3.save!
puts "Third real business created"

puts "Fourth real business"
coupon4 = Coupon.create!(
  title: "50% off on all products at Wong",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "All products",
  product_description: "Only valid at Wong La Molina first 80 customers",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Wong, Av. La Molina 378, Lima, Lima Province 15023, Peru"
)
file4 = URI.open("https://www.shutterstock.com/image-vector/50-percent-mega-discount-sale-260nw-1197428440.jpg")
coupon4.photo.attach(io: file4, filename: 'allproducts.jpg', content_type: 'image/jpg')
coupon4.save!
puts "Fourth real business created"

puts "Fifth real business"
coupon5 = Coupon.create!(
  title: "20% off on Nestle products at Tottus",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Nestle products",
  product_description: "Only valid at Tottus Carretera Central",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Tottus, Av. Carretera Central 135, Lima, Lima Province 15008, Peru"
)
file5 = URI.open("https://www.ruthdelacruz.com/wp-content/uploads/2022/01/shopee-nestle.png")
coupon5.photo.attach(io: file5, filename: 'nestle.png', content_type: 'image/png')
coupon5.save!
puts "Fifth real business created"

puts "Sixth real business"
coupon6 = Coupon.create!(
  title: "15% off on legumes at Metro",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Legumes",
  product_description: "Only valid at Metro Nicolas Ayllon",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Metro, Av. Nicolás Ayllon 4297, Urb. Vista Alegre, Lima, Lima Province 15498, Peru"
)
file6 = URI.open("https://saveoncannabis.com/wp-content/uploads/2022/11/Orange-County-CBD-Discount-15-Save-On-Cannabis-Website.jpg")
coupon6.photo.attach(io: file6, filename: 'legumes.jpg', content_type: 'image/jpg')
coupon6.save!
puts "Sixth real business created"

puts "Seventh real business"
coupon7 = Coupon.create!(
  title: "20% off bread",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Bread",
  product_description: "Only valid at Wong Camacho",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Wong, Edificio Panorama, Lima, Lima Province 15023, Peru"
)
file7 = URI.open("https://www.lovealoaf.com/wp-content/uploads/2020/03/160149313_4276668522346699_5657126526868955083_o.jpg")
coupon7.photo.attach(io: file7, filename: 'bread.jpg', content_type: 'image/jpg')
coupon7.save!
puts "Seventh real business created"

puts "Eighth real business"
coupon8 = Coupon.create!(
  title: "5% off on all products at Tottus",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "All products",
  product_description: "Only valid at Tottus Molicentro",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Tottus, Molicentro, Lima, Lima Province 15026, Peru"
)
file8 = URI.open("https://i.allheart.com/images/articles/coupons/ah-coupons_5-percent-07082019.png")
coupon8.photo.attach(io: file8, filename: '5allproducts.png', content_type: 'image/png')
coupon8.save!
puts "Eighth real business created"

puts "Ninth real business"
coupon9 = Coupon.create!(
  title: "25% off cereals at Mass",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Cereals",
  product_description: "Only valid at Mass Av. El Aire",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Mass El Aire, Av El Aire, Lima, Lima Province 15021, Peru"
)
file9 = URI.open("https://cdn10.bigcommerce.com/s-sby4jv/product_images/uploaded_images/25-off-holiday-deal-optimized-12.7.2018.jpg")
coupon9.photo.attach(io: file9, filename: 'cereals.jpg', content_type: 'image/jpg')
coupon9.save!
puts "Ninth real business created"

puts "Tenth real business"
coupon10 = Coupon.create!(
  title: "20% off chocolate at Tottus",
  start_time: Faker::Date.between(from: (1..3).to_a.sample.days.from_now, to: (3..5).to_a.sample.days.from_now),
  end_time: Faker::Date.between(from: (6..8).to_a.sample.days.from_now, to: (9..10).to_a.sample.days.from_now),
  product_name: "Chocolate",
  product_description: "Only valid at Tottus San Luis",
  code: Faker::Code.nric,
  owner: User.owners.sample,
  address: "Tottus, Av. San Luis 2399, Lima, Lima Province 15037, Peru"
)
file10 = URI.open("https://d168jcr2cillca.cloudfront.net/uploadimages/coupons/13661-The_Chocolate_Room_Somajiguda_Coupon_3.jpg")
coupon10.photo.attach(io: file10, filename: 'chocolate.jpg', content_type: 'image/jpg')
coupon10.save!
puts "Tenth real business created"

puts "Creating 30 bookmarks"
30.times do
  Bookmark.create!(
    client: User.customers.sample,
    coupon: Coupon.all.sample
  )
end
puts "30 bookmarks created"
