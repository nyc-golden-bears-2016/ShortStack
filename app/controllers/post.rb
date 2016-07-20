get '/posts/new' do
  erb :'posts/new'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @replies = Reply.all.where(post_id: params[:id])
  erb :'posts/show'
end

put '/posts/best_answer' do
  post = Post.find(params[:post_id])
  post.update_attribute("best_answer", params[:reply_id])
  redirect '/posts/#{post.id}'
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
