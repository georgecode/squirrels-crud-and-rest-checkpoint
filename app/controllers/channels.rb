get '/channels' do
end
get '/channels/new' do
end
post '/channels' do
end
get '/channels/:id' do
  @channel = Channel.find(params[:id])
  erb :'channels/show'
end
get '/channels/:id/edit' do
end
put '/channels/:id' do
end
delete '/channels/:id' do
end