# post "/answers" do
# 	@answers = Answer.new(text: params[:answer], user_id: session[:user_id], question_id: params[:id])
#
# 	if @answer.save
#
# 	else
# 		@errors = "Invalid input"
# 		erb :"/"
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

delete "/answers/:id" do
  @answer = Answer.find(params[:id])
  question = @answer.question
  @answer.destroy

  redirect :"/questions/#{question.id}"
end