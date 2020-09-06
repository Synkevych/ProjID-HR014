class AuditsController < ApplicationController
   before_action :set_checklist, only: [:index, :create]

  def index
    @audits = Checklist.all
      .paginate(page: params[:page])
  end
  
  def show
  end
  
  def new
    @show_form = true
    @checklist = Checklist.find(params[:checklist_id])
  end

  def create
    @answer = @checklist.questions.new(question_params)
    if @question.save
      redirect_to checklist_path(@checklist)
    else
      flash[:error] = "Something went wrong, the comment wasn't deleted"
    end
  end
  
  private
  def set_checklist
    @checklists = Checklist.all
      .paginate(page: params[:page])
  end
end
