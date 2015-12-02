# Display new user
get '/users/new' do
	erb :"user/new"
end

# Create user
post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end

#Display user edit form
get '/users/:id/edit' do
@user = User.find(params[:id])
	erb :"/user/edit"
end

# Update user
patch '/users/:id' do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password])
end

# Delete user profile
delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	erb :"/static/index"
end

#View user
get '/users/:id' do
	@user = User.find(params[:id])
	erb :"/user/show"
end

# view login page
get '/users' do
	erb :"/users/index"
end

# user login
post 'users/login' do
	user = User.find_by(email: params[:email], password: params[:password])
end