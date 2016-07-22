get '/posts/new' do
  erb :'posts/new'
end

get '/posts/:id' do
  if !(Post.find_by(id: params[:id])).nil?
    @post = Post.find(params[:id])
    @replies = Reply.all.where(post_id: params[:id])
    @replies = @replies.sort { |a, b|  b.points <=> a.points}
    erb :'posts/show'
  else
    "This post does not exist"
  end
end

post '/posts/:id/vote' do
  post = Post.find_by(id: params[:id])
  if post.votes.find_by(user_id: session[:user_id]).nil?
    vote = Vote.new(vote_value: params[:vote].to_i, user_id: current_user.id)
    vote.votable = post
    if vote.save
      if request.xhr?
        post.points.to_s
      else
        redirect '/'
      end
    else
      alert('error')
    end
  elsif request.xhr?
   post.points.to_s
  end
end


put '/posts/best_answer' do
  @post = Post.find(params[:post_id])
  @post.update_attribute("best_answer", params[:reply_id])

  if request.xhr?
    erb :'posts/best_answer', layout: false
  else
    redirect "/posts/#{@post.id}"
  end
end

post '/posts' do
  post = Post.new(content: params[:post],
                  user_id: current_user.id,
                  title: params[:title])
  if post.save
    redirect '/'
  else
    "errors"
  end
end

delete "/posts/:id" do
      post = Post.find(params[:id])
      post.destroy
    if request.xhr?
      params[:id]
    else
      redirect "/"
    end
end

