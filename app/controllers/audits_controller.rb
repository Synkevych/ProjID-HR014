class AuditsController < ApplicationController
  
   before_action :find_all_checklists, only: [:index]
   before_action :find_checklist!, only: [:new, :create, :show]
   before_action :find_audit!, only:[:show, :destroy, :edit, :create, :update]
  
  # GET /audits
  def index
    @audits = Audit.all
      .order('created_at DESC')
      .paginate(page: params[:page])
    @published_checklist = @checklists.published.order('created_at DESC')
  end
  
  # GET /audits/1
  def show
  end
  
  # GET /audits/new
  def new
    @show_answer_form = true
    @audit = @checklist.audits.create
  end
  
  # GET /audits/1/edit
  def edit
    @show_answer_form = true
  end

  # POST /audits
  def create
    @answer = Audits::CreateService.call(@audit)
    if @answer
      redirect_to checklist_path(@audit)
      flash[:success] = 'Audit was successfully created.' 
    else
      redirect_to checklists_path
      flash[:danger] = ' There was a problem with destroying this audit.' 
    end
  end

  # PATCH/PUT /audits/1
  def update
    redirect_to @audit
    flash[:success] = 'Checklist was successfully updated.'
  end

  # DELETE /audits/1
  def destroy
    @audit.destroy
    redirect_to audits_path
    flash[:error] = 'Audit was successfully destroyed.' 
  end
  
  private
    # Find a checklist using to show them in index page 
    def find_all_checklists
      @checklists = Checklist.all
        .paginate(page: params[:page])
    end

    # Find a checklist using it ID
    def find_checklist!
      @checklist = Checklist.find(params[:checklist_id])
    end

      # Only allow a list of trusted parameters through.
    def find_audit!
      @audit = Audit.find(params[:id])
    end
end
