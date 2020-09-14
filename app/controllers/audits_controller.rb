class AuditsController < ApplicationController
  
  before_action :find_all_checklists, only: [:index]
  before_action :find_checklist!, only: [:new, :create, :show]
  before_action :find_audit!, only:[:show, :destroy, :edit, :create, :update]
  
  # GET /audits
  def index
    @audits = Audit.all
      .order('created_at DESC')
      .paginate(page: params[:page])
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

  # PATCH/PUT /audits/1
  def update
    redirect_to @audit
    flash[:success] = 'Checklist was successfully updated.'
  end

  # DELETE /audits/1
  def destroy
    if @audit.destroy
      redirect_to audits_path
      flash[:error] = 'Audit was successfully destroyed.' 
    else
      # respond_to :js
      flash[:error] = "Audit has not been deleted! Something went wrong"
      render status: 422
    end
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
