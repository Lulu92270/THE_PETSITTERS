require "open-uri"

puts "cleaning DB"


Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "creating users"

user = User.create(email: "lola@lola.com", password: "123456",role: "petowner", name: "lola", address: "Lisbonne")

file = URI.open('https://omg.blog/wp-content/uploads/2018/09/yorikokoro.jpg')


pet = Pet.new(name: "toto", species: "dog", pet_owner: User.first)
pet.photo.attach(io: file, filename: 'toto.jpeg', content_type: 'image/jpeg')
pet.save
