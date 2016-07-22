get '/' do
  @posts = Post.all
  @posts = @posts.sort { |a, b|  b.points <=> a.points}
  erb :index
end


