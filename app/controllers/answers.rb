post "/answers" do
	p params
	@answers = Answer.create(text: params[:answer], user_id: session[:user_id], question_id: params[:id])
	erb :"/questions"
end