get '/login/new' do
  erb :'login/new'
end


post '/login' do
  @user_info = User.find_by email:params[:email]
  # if the email exists and the password matches
  if @user_info != nil && @user_info.password == params[:password]
    session[:user_id] = @user_info.id

    redirect "/users/#{@user_info.id}"
  else
    @error ="*Error: Email and password do not match"

    erb :'/login/new'
  end
end

delete '/logout' do
    session.delete(:user_id)

    redirect '/'
end