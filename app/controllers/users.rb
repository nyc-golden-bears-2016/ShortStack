get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user= User.new(params[:user])

  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  if User.find_by(username: params[:username]).try(:authenticate, params[:password] )
    user_id = User.find_by(username: params[:username]).id
    session[:user_id] = user_id
    redirect '/'
  else
    @errors = ["Incorrect username or password"]
    erb :'/users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
