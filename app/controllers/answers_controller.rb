class AnswersController < ApplicationController

  before_action :find_audit!
  before_action :find_question!, only: [:show]

  # POST /audits/1/answers
  def create
    @answer = @audit.answers.build(answer_params)

    if @answer.save
      flash[:success] = "Your answer has been saved."
    else
      flash[:error] = @answer.errors.full_messages.join("\n")
    end
  end
  
  private
    # Find an audits using it ID
    def find_audit!
      @audit = Audit.find(params[:audit_id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :comment)
    end
end
