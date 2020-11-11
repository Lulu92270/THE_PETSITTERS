require "open-uri"

# puts "destroying all Bookings..."
# Booking.destroy_all

# puts "destroying all Users with it's pets...\n"
# User.destroy_all

i = 1
pets_img = []

# 10.times do
#   pets_img << Cloudinary::Uploader.upload("pet#{i}.jpg")['url']
#   puts "#{"pet#{i}.jpg"} file: #{pets_img[i - 1]} uploaded..."
#   i += 1
# end

# i = 0
# 5.times do
#   user = User.create!(email: Faker::Internet.unique.email, password: Faker::Alphanumeric.alpha(number: 6), name: Faker::FunnyName.unique.name, role: ["petowner", "petsitter"].sample, address: Faker::Address.unique.city )
#   puts "\n#{user.name.capitalize} is a #{user.role.upcase} and has 2 pets: "
#   s = 0
#   2.times do
#     file = URI.open(pets_img[i])
#     pet = Pet.new(name: Faker::Creature::Dog.name, species: ["dog", "cat"].sample) #, pet_owner: user)
#     pet.pet_owner = user
#     pet.photo.attach(io: file, filename: 'toto.jpeg', content_type: 'image/jpeg')
#     pet.save!
#     my_pet = "A #{pet.species.capitalize} named #{pet.name}"
#     sentence = s == 0 ? my_pet : " and #{my_pet}."
#     s += 1
#     i += 1
#     print sentence
#   end
#   puts "\n"
# end

# puts "\nCreating Bookings...\n"
# 5.times do
#   my_date = Faker::Date.between(from: 30.days.ago, to: Date.today)
#   booking = Booking.create!(date: my_date, user: User.all.sample, pet: Pet.all.sample)
#   booking.save
#   puts "#{booking.user.name.capitalize} has booked on #{booking.date} for his #{booking.pet.species} named #{booking.pet.name.capitalize}"
# end

file = URI.open('https://omg.blog/wp-content/uploads/2018/09/yorikokoro.jpg')
user = User.create(email: "lola@lola.com", password: "123456", role: "petowner", name: "lola", address: "Lisbonne")

pet = Pet.new(name: "toto", species: "dog", pet_owner: User.first)
pet.photo.attach(io: file, filename: 'toto.jpeg', content_type: 'image/jpeg')
pet.save!
