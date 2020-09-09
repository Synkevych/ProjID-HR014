class ChecklistsController < ApplicationController
  before_action :set_checklist!, only: [:show, :edit, :update, :destroy]
  respond_to :js

  # GET /checklists
  def index
    @checklists = Checklist.all
      .paginate(page: params[:page])
  end

  # GET /checklists/1
  def show
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new
  end

  # GET /checklists/1/edit
  def edit
  end

  # POST /checklists
  def create
    @checklist = Checklist.new(checklist_params)
    if @checklist.save
      flash[:success] = 'Checklist was successfully created.'
      redirect_to checklist_path(@checklist)
    else
      flash[:error] = @checklist.errors.full_messages.join("\n")
    end
  end

  # PATCH/PUT /checklists/1
  def update
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.html { redirect_to @checklist, flash: {success: 'Checklist was successfully updated.' }}
      else
        format.html { render :edit, flash: {success: @checklist.errors, status: :unprocessable_entity }}
      end
    end
  end

  # DELETE /checklists/1
  def destroy
    @checklist.destroy
    respond_to do |format|
      format.html { redirect_to checklists_url, flash[:success] = 'Checklist was successfully destroyed.' }
    end
  end

  private
    # Find a checklist using it ID
    def set_checklist!
      @checklist = Checklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checklist_params
      params.require(:checklist).permit(:title, :description, :publish)
    end
end
