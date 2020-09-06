class AnswersController < ApplicationController
  
  # @!group Callbacks
  before_action :find_checklist!
  before_action :find_question!

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to checklist_audits_path(@checklist)
    else
      flash[:error] = "Something went wrong, the comment wasn't deleted"
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def find_checklist!
    @checklist = Checklist.find(params[:checklist_id])
  end
  
  def find_question!
    @question = Question.find(params[:question_id])
  end
    
  def answer_params
    params.require(:answer).permit(:answer, :comment)
  end

end
