# 10.times do |num|
#   User.create(username:"test" + num.to_s, email:"test" + num.to_s, password: "test")
# end
# 10.times do
#   Post.create(title: "test1" + rand(10).to_s , content: "test1", user_id: rand(1..10).to_s)
# end
# 100.times do
#   Reply.create(response: "I have many opinions.", post_id: rand(1..10), user_id: rand(1..10))
# end
25.times do
  user = User.create(username: Faker::Name.first_name, email:Faker::Internet.email, password: "test")
  2.times do
    post = Post.create(title: Faker::ChuckNorris.fact, content: Faker::Lorem.paragraph(2), user_id: rand(1..25))
    15.times do
      post.replies.create(response: Faker::StarWars.quote, post_id: post.id, user_id: rand(1..25))
    end
  end
end
