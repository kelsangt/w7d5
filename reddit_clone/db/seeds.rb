# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# 50.times do
#     # User.create(
#     #     username: Faker::Name.name,
#     #     password: Faker::Internet.password
#     # )
#     Post.create(
#         title: Faker::Quote.yoda, 
#         content: Faker::Lorem.paragraph(sentence_count: 5),
#         sub_id: rand(1..15),
#         author_id: rand(1..50)
#     )

# end

# 15.times do 
#     Sub.create(
#         title: Faker::Hobby.activity,
#         moderator_id: rand(1..10)
#     )
# end


50.times do
    Post.create(
        title: Faker::Quote.yoda, 
        content: Faker::Lorem.paragraph(sentence_count: 5),
        sub_id: rand(1..15),
        author_id: rand(1..50)
    )
end