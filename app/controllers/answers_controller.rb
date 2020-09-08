class AnswersController < ApplicationController
  
  # @!group Callbacks
  before_action :find_audit!
  before_action :find_question!, only: [:show]

  def create
    @answer = @audit.answers.build(answer_params)
    if @answer.save
       flash[:success] = "Your answer has been saved."
    else
      flash[:error] = "Something went wrong, the comment wasn't deleted."
    end
  end
  
  private
  # callbacks
  def find_audit!
    @audit = Audit.find(params[:audit_id])
  end
    
  def answer_params
    params.require(:answer).permit(:answer, :comment)
  end

end
