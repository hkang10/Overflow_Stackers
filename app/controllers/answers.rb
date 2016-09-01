# post "/answers" do
# 	@answers = Answer.new(text: params[:answer], user_id: session[:user_id], question_id: params[:id])
#
# 	if @answer.save
#
# 	else
# 		@errors = "Invalid input"
# 		erb :"/"
# 	end
# end

# get "/answers/:id" do
#   @answer = Answer.find(params[:id])
#   question_id
#   erb :"/"
# end
 
post "/answers/:id/comments" do
  @comment = Comment.create(text: params[:comment], user_id: session[:user_id], commentable_id: params[:id], commentable_type: "Answer")
  answer = Answer.find(params[:id])
  question_id = answer.question_id

  if request.xhr?
    erb :'comments/_show', layout: false, locals: { comment: @comment }
  else
    redirect "/questions/#{question_id}"
  end
end

<<<<<<< HEAD
=======

>>>>>>> 33a1025ea9b73208d3d6d0bbcad0277f85fec83e
delete "/answers/:id" do
  @answer = Answer.find(params[:id])
  question = @answer.question
  @answer.destroy

  redirect :"/questions/#{question.id}"
end

post '/answers/:id/upvote' do
    answer = Answer.find(params[:id])
    answer.votes.create(value: 1, user_id: session[:user_id])
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
    answer.votes.create(value: -1, user_id: session[:user_id])
    question_id = answer.question_id
  # if request.xhr?
  #   # content_type :json
  #   answer.votes.count.to_s
  # else
    redirect "/questions/#{question_id}"
  # end
end
<<<<<<< HEAD
=======

>>>>>>> 33a1025ea9b73208d3d6d0bbcad0277f85fec83e
