post '/replies/new' do
  reply = Reply.new(response: params[:response],
                    user_id: current_user.id,
                    post_id: params[:post] )
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
