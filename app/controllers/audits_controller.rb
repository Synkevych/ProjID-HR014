class AuditsController < ApplicationController
  
   before_action :find_all_checklists, only: [:index]
   before_action :find_checklist!, only: [:new, :create, :show]
   before_action :find_audit!, only:[:show, :destroy, :edit, :create]

  def index
    @audits = Audit.all
      .paginate(page: params[:page])
  end
  
  def show
  end
  
  def new
    @show_answer_form = true
    @audit = @checklist.audits.create
  end
  
  def edit
    @show_answer_form = true
  end

  def create
    @answer = Audits::CreateService.call(@audit)
    if @answer
      redirect_to checklist_path(@audit)
    else
      redirect_to checklists_path
    end
  end

  def destroy
    @audit.destroy
    redirect_to audits_path 
  end
  
  private

  def find_all_checklists
    @checklists = Checklist.all
      .paginate(page: params[:page])
  end

  def find_checklist!
    @checklist = Checklist.find(params[:checklist_id])
  end

  def find_audit!
    @audit = Audit.find(params[:id])
  end
end
