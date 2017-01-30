get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(first_name: params[:first_name],last_name: params[:last_name], email: params[:email],password: params[:password])
  if @user.save
    #start session
    session[:user_id] = @user.id

    redirect "/users/#{@user.id}"
  else
    @error = "Error: Missing feilds or email already exists"
    erb :'/users/new'
  end
end


get '/users/:id' do

  #gets params from url
  @user = User.find(params[:id])
  if @user.id == session[:user_id]

  @user_channels = @user.channels



  erb :'users/show'



  else
    # if you try to access a user thats not you
    p "nice try mr.robot"
  end

end
