10.times do |num|
  User.create(username:"test1" + num.to_s, email:"test1" + num.to_s, password_digest: "test")
end
10.times do
  Post.create(title: "test1" + rand(10).to_s , content: "test1", user_id: rand(10).to_s)
end
100.times do
  Reply.create(response: "I have many opinions.", post_id: rand(10), user_id: rand(10))
end
