post "/answers" do
	p params
	@answers = Answer.create(text: params[:answer], user_id: session[:user_id], question_id: params[:id])
	erb :"/questions"
end

# get "/answers/:id" do
#   @answer = Answer.find(params[:id])
#   question_id
#   erb :"/"
# end

post "/answers/:id/comments" do
  @comment = Comment.create(text: params[:comment], user_id: session[:user_id], commentable_id: params[:id], commentable_type: "Answer")
  answer = Answer.find(params[:id])
  question_id = answer.question_id

  redirect "/questions/#{question_id}"
end

post '/answers/:id/upvote' do
    answer = Answer.find(params[:id])
    answer.votes.create(value: 1)
    question_id = answer.question_id
  # if request.xhr?
  #   # content_type :json
  #   answer.votes.count.to_s
  # else
    redirect "/questions/#{question_id}"
  # end
end

post '/answers/:id/downvote' do
    answer = Answer.find(params[:id])
    answer.votes.create(value: -1)
    question_id = answer.question_id
  # if request.xhr?
  #   # content_type :json
  #   answer.votes.count.to_s
  # else
    redirect "/questions/#{question_id}"
  # end
end

