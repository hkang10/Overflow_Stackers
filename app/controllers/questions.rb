get '/questions' do
  @questions = Question.all
  erb :"/questions/index"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  votes = @question.votes
  @vote_count = 0
  votes.each do |vote|
    @vote_count += vote.value
  end
  erb :"/questions/show"
end