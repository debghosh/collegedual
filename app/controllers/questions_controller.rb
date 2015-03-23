class QuestionsController < ApplicationController

  def show_question
    @first_college = params["first_college"]
    @second_college = params["second_college"]
    @questions = Question.get_questions(@first_college, @second_college).paginate(page: params[:page], per_page: 1)
  end

end
