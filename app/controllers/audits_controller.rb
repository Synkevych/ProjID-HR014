class AuditsController < ApplicationController
   before_action :set_checklists, only: [:create, :index]

  def index
    @audits = Audit.all
      .paginate(page: params[:page])
  end
  
  def show
  end
  
  def new
    @show_form = true
    @checklist = Checklist.find(params[:checklist_id])
  end

  def create
    @checklist = Checklist.find(params[:checklist_id])
    @audit = @checklist.audits.build
    if @audit.save
      redirect_to checklist_audits_path(@checklist)
    else
      flash[:error] = "Something went wrong, the comment wasn't deleted"
    end
  end
  
  private
  def set_checklists
    @checklists = Checklist.all
      .paginate(page: params[:page])
  end
end
