require 'faker'

Photo.destroy_all
Chapter.destroy_all
Ted.destroy_all
User.destroy_all

puts "Creating 1 user..."
user = User.create(
  email:"polo@hello.com" ,
  password:"password" ,
  password_confirmation: "password"
)
puts "User created : #{user.email} / #{user.password}\n"

puts "Creating 5 travelers..."
travelers = []
5.times do
  print "."
  travelers << User.create(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar_url: 'https://api.adorable.io/avatars/285/abott@adorable.png'
  )
end
puts "\n"

puts "Creating Teds with chapters"
ted = Ted.create(
  name: Faker::Name.first_name,
  user: user,
  rank: Faker::Number.between(1, 5),
  distance_traveled: Faker::Number.between(10, 3000),
  avatar_url: 'http://helpsimus.org/blog/wp-content/uploads/2010/11/peluche-et-enfant.jpg'
)

chapter = ted.chapters.create(
  user: travelers.sample,
  description: Faker::HarryPotter.quote,
  localisation: 'Paris',
  likes: 0
)

chapter.photos.create(
  image_url: 'http://www.parisattitude.com/images/monuments.jpg',
  title: 'A great view from Paris',
  description: 'We were near the Eiffel Tower'
)

chapter.photos.create(
  image_url: 'http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1444253482/DG2015-paris.jpg?itok=XH81cBH9',
  title: 'Such a beautiful city',
  description: 'This picture speaks on itself'
)

chapter.photos.create(
  image_url: 'https://cdn.theculturetrip.com/wp-content/uploads/2015/11/Paris-%C2%A9-Ditty_about_summer-Shutterstock.jpg',
  title: 'Paris from top',
  description: 'The roofs of Paris'
)

chapter.photos.create(
  image_url: 'http://cdn-image.travelandleisure.com/sites/default/files/styles/tnl_redesign_article_landing_page/public/1446842493/3-paris-social-niche1115.jpg?itok=wA-uNK8P',
  title: 'Arc de triomphe',
  description: 'So famous monument !'
)

3.times do
  chapter = ted.chapters.create(
    user: travelers.sample,
    description: Faker::HarryPotter.quote,
    localisation: Faker::Address.country,
    likes: 0
  )

  3.times do
    chapter.photos.create(
      image_url: Faker::LoremPixel.image("200x200"),
      title: Faker::Hipster.sentence,
      description: Faker::Hipster.sentence
    )
  end
end

5.times do
  ted = Ted.create(
    name: Faker::Name.first_name,
    user: user,
    rank: Faker::Number.between(1, 5),
    location: ['New-York', 'Rome', 'Berlin', 'Saint-Etienne', 'Londres', 'Bankok'].sample,
    distance_traveled: Faker::Number.between(10, 3000),
    avatar_url: Faker::LoremPixel.image("100x100")
  )
end
