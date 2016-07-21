10.times do |num|
  User.create(username:"test" + num.to_s, email:"test" + num.to_s, password: "test")
end
10.times do
  Post.create(title: "test1" + rand(10).to_s , content: "test1", user_id: rand(1..10).to_s)
end
100.times do
  Reply.create(response: "I have many opinions.", post_id: rand(1..10), user_id: rand(1..10))
end
