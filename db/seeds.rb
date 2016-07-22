10.times do
  user = User.create(username: Faker::Name.first_name, email:Faker::Internet.email, password: "test")
  2.times do
    post = Post.create(title: Faker::ChuckNorris.fact, content: Faker::Lorem.paragraph(2), user_id: rand(1..10))

    rand(1..20).times do
      post.votes.create(vote_value: [1,-1].sample, user_id: rand(1..10), votable_type: "Post", votable_id: post.id)
    end

    10.times do
      reply = post.replies.create(response: Faker::StarWars.quote, post_id: post.id, user_id: rand(1..10))

      rand(1..20).times do
        reply.votes.create(vote_value: [1,-1].sample, user_id: rand(1..10), votable_type: "Reply", votable_id: reply.id)
      end

    end
  end
end
