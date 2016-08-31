before do
  @errors = Array.new
end

get "/sessions/new" do
  erb :"/sessions/new"
end

post "/sessions" do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/questions"
  else
    @errors << "Invalid Credentials"
    erb :"/sessions/new"
  end
end

get "/sessions/logout" do
  session[:user_id] = nil
  redirect "/sessions/new"
end
