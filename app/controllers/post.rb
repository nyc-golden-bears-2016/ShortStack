get '/posts/:id' do
  @post = Post.find(params[:id])
  @replies = Reply.all.where(post_id: params[:id])
  erb :'posts/show'
end
