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
    @errors = "Invalid input"
    erb :"/questions/new"
  end
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])

  erb :'/questions/edit'
end

put '/questions/:id/edit' do
  @question = Question.find(params[:id])
  @question.text = params[:question]
  @question.save

  redirect "/questions"
end

delete '/questions/:id' do
  question = Question.find(params[:id])
  question.destroy

  redirect "/questions"
end

# Where should this live? negative: hidden field vs nested route
# creating answer here?

post "/questions/:id/answers" do
  @answer = Answer.create(text: params[:answer], user_id: session[:user_id], question_id: params[:id])
<<<<<<< HEAD
=======

>>>>>>> 33a1025ea9b73208d3d6d0bbcad0277f85fec83e
  if request.xhr?
      erb :'answers/_show', layout: false, locals: { answer: @answer }
  else
    redirect "/questions"
<<<<<<< HEAD
=======

>>>>>>> 33a1025ea9b73208d3d6d0bbcad0277f85fec83e
  end

end

post '/questions/:id/upvote' do
    question = Question.find(params[:id])
    question.votes.create(value: 1,user_id: session[:user_id])

    redirect "/questions"

end

post '/questions/:id/downvote' do
    question = Question.find(params[:id])
    question.votes.create(value: -1,user_id: session[:user_id] )
  # if request.xhr?
  #   # content_type :json
  #   question.votes.count.to_s
  # else
    redirect "/questions"
  # end
end
