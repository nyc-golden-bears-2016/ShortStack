post '/replies/new' do
  reply = Reply.new(response: params[:response])
  binding.pry
  post = Post.find(reply.post_id)
  if reply.save
    if request.xhr?
      # partial file
    else
      redirect "/posts/#{post.id}"
    end
  else
    #raise errors
  end
end
