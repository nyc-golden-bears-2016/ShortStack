post '/replies/new' do
  @reply = Reply.new(response: params[:response],
                    user_id: current_user.id,
                    post_id: params[:post] )
  post = Post.find(@reply.post_id)
  if @reply.save
    if request.xhr?
      erb :'posts/new_partial', layout: false, locals: {  reply: @reply }
    else
      redirect "/posts/#{post.id}"
    end
  else

  end
end

put '/replies/:id' do
  reply = Reply.find(params[:id])
  reply.update_attribute("response", params[:response])
  if request.xhr?
    request[:response]
  else
    redirect "/posts/#{reply.post_id}"
  end
end

delete '/replies/:id' do
  reply = Reply.find(params[:id])
  if request.xhr?
    params[:id]
  else
    reply.destroy
    redirect "/posts/#{reply.post_id}"
  end
end
