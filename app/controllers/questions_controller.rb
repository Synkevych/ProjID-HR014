class QuestionsController < ApplicationController
  before_action :find_checklist!, only: [:create]

  def create
    @question = @checklist.questions.new(question_params)
    if @question.save
      redirect_to checklist_path(@checklist)
    else
      flash[:error] = "Something went wrong, the question wasn't created"
    end
  end

  private
  # callbacks
  def find_checklist!
    @checklist = Checklist.find(params[:checklist_id])
  end
    
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
