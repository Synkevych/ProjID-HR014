class AnswersController < ApplicationController

  before_action :find_audit!
  before_action :find_checklist!
  before_action :find_answer!, only: [:edit, :update]
  
  def new; end

  def edit; end
  
  # POST /checklists/1/audits/1/answers
  def create
    @answer = @audit.answers.build(answer_params)

    if @answer.save
      flash[:success] = "Your answer has been saved."
    else
      flash[:error] = @answer.errors.full_messages.join("\n")
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = 'Answer was successfully updated.'
    else
      flash[:error] = @checklist.errors.full_messages.join("\n")
      render :new 
    end
  end
  
  private
    # Find an audits using it ID
    def find_audit!
      @audit = Audit.find(params[:audit_id])
    end
    # Find an checklist using it ID
    def find_checklist!
      @checklist = Checklist.find(params[:checklist_id])
    end
    # Find an question using it ID
    def find_answer!
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :comment, :question_id)
    end
end
