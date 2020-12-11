require "open-uri"

puts "destroying all Bookings..."
Booking.destroy_all

puts "destroying all Users with it's pets...\n"
Pet.destroy_all
User.destroy_all

i = 0
pets_img = []
img_names = ["dog1.jpg", "dog2.jpg", "dog3.jpg", "dog4.jpg", "dog5.jpg", "dog6.jpg", "cat1.jpg", "cat2.jpg", "cat3.jpg", "cat4.jpg"].shuffle

img_names.size.times do
  pets_img << Cloudinary::Uploader.upload(img_names[i])['url']
  puts "#{img_names[i]} uploaded..."
  i += 1
end

ADDRESS_ARRAY = ["Alfama, Lisbon", "Graça, Lisbon", "Marques do Pombal, Lisbon", "Bario Alto, Lisbon", "Cascais" ]

i = 0
ADDRESS_ARRAY.each do |address|

  profile_img = Cloudinary::Uploader.upload('profile.jpg')['url']

  user = User.new(email: Faker::Internet.unique.email, password: Faker::Alphanumeric.alpha(number: 6), name: Faker::TvShows::TwinPeaks.character, role: "Pet owner", address: address )
  user.photo.attach(io: URI.open(profile_img), filename: 'profile.jpg', content_type: 'image/jpg')
  user.save!

  puts "\n#{user.name.capitalize} is a #{user.role.upcase} and has 2 pets: "
  s = 0
  2.times do
    file = URI.open(pets_img[i])
    pet = Pet.new(name: Faker::Creature::Dog.name, species: img_names[i][0..2], pet_owner: user)
    pet.photo.attach(io: file, filename: 'toto.jpeg', content_type: 'image/jpeg')
    pet.save!
    my_pet = "A #{pet.species.capitalize} named #{pet.name}"
    sentence = s == 0 ? my_pet : " and #{my_pet}."
    s += 1
    i += 1
    print sentence
  end
  puts "\n"
end

puts "\nCreating Lola as a Petowner..."
file = URI.open('https://omg.blog/wp-content/uploads/2018/09/yorikokoro.jpg')
user = User.create!(email: "lola@lola.com", password: "123456", role: "Pet owner", name: "lola", address: ADDRESS_ARRAY.sample)
pet = Pet.new(name: "toto", species: "dog", pet_owner: user)
pet.photo.attach(io: file, filename: 'toto.jpeg', content_type: 'image/jpeg')
pet.save!

puts "Creating Marion as a Petsitter..."
user = User.create!(email: "marion@marion.com", password: "123456", role: "Pet sitter", name: "marion", address: ADDRESS_ARRAY.sample)

# puts "\nCreating Bookings...\n"
# 5.times do
#   my_date = Faker::Date.between(from: 30.days.ago, to: Date.today)
#   booking = Booking.create!(date: my_date, user: User.all.sample, pet: Pet.all.sample)
#   booking.save
#   puts "#{booking.user.name.capitalize} has booked on #{booking.date} for his #{booking.pet.species} named #{booking.pet.name.capitalize}"
# end
