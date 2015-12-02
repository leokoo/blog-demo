# Display new user
get '/users/new' do
	erb :"user/new"
end

# Create user
post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect '/users/"#{user.id}"'
end

#Display user edit form
get '/users/:id/edit' do
@user = User.find(params[:id])
	erb :"/user/edit"
end

# Update user
patch '/users/:id' do
end

# Delete user profile
delete '/users/:id' do

end

#View user
get '/users/:id' do
	@user = User.find(params[:id])
	erb :"/user/show"
end