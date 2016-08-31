get '/questions' do
  @questions = Question.all
  erb :"/questions/index"
end

get '/questions/new' do

  erb :"/questions/new"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"/questions/show"
end


post '/questions' do
  question = Question.new(text: params[:question], user_id: session[:user_id])
  if question.save
    redirect "/questions"
  else
    @errors = self.errors.full_messages
    erb :"/questions/new"
  end
end
