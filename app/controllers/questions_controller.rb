class QuestionsController < ApplicationController
  before_action :find_checklist!, only: [:create, :new]
  respond_to :js

  def new; end

  # POST /checklists/1/questions
  def create
    @question = @checklist.questions.new(question_params)
    
    if @question.save
      redirect_to checklist_path(@checklist)
      flash[:success] = "Question created."
    else
      flash[:error] = @question.errors.full_messages.join("\n")
      render :new
    end
  end

  private
    # Find a checklist using it ID
    def find_checklist!
      @checklist = Checklist.find(params[:checklist_id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
