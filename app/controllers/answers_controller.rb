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
    respond_to do |format|
      if @checklist.update(answer_params)
        format.html { redirect_to @checklist, flash: {success: 'Checklist was successfully updated.' }}
      else
        format.html { render :edit, flash: {error: @checklist.errors, status: :unprocessable_entity }}
      end
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
