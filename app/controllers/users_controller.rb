enable :sessions

# In users_controller.rb
post '/signup' do
  user = User.new(params[:user])
  user.valid?
  if user.save
    # what should happen if the user is saved?
    @user = "Thank you for signing up!"

  else
    # what should happen if the user keyed in invalid date?
    @error = user.errors.messages[:email][0]
  end
  erb :"static/index"
end

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  u = User.find_by(email: params[:user][:email])
  if u && u.authenticate(params[:user][:password])
    # session[:user_id] = user.id
    session[:id] = u.id # session is to rememeber the user and with that user_id, it remembers it at each page that the user visit
    redirect to '/users/:id'
    # erb :"/static/success"
    else
    redirect "/"
    # erb :"static/index"
  end
end

# get '/login' do
#   erb :"static/success"
# end

post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  session[:id] = nil
  redirect "/" # this will redirect user back to the main home page which is the signup/login page.
  # redirect "/logout" # redirect the user logout to get '/logout', the page where display "Thank you for visiting. Please come back again!"
end

# get '/logout' do
#   p "Thank you for visiting. Please come back again!"
# end

get '/users/:id' do
  # some code here
  erb :"static/profile"
end
