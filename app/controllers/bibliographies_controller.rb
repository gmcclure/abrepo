class BibliographiesController < ApplicationController
  before_action :set_bibliography, only: [:show, :edit, :update, :destroy]

  # GET /bibliographies
  # GET /bibliographies.json
  def index
    @course = Course.find(params[:course_id])
    @bibliographies = Bibliography.where("course_id = ? AND user_id = ?", params[:course_id], current_user.id)
  end

  # GET /bibliographies/1
  # GET /bibliographies/1.json
  def show
  end

  # GET /bibliographies/new
  def new
    @course = Course.find(params[:course_id])
    @bibliography = Bibliography.new
  end

  # GET /bibliographies/1/edit
  def edit
  end

  # POST /bibliographies
  # POST /bibliographies.json
  def create
    @course = Course.find(params[:course_id])
    @bibliography = Bibliography.new(bibliography_params)
    @bibliography.course = @course
    @bibliography.user = current_user

    respond_to do |format|
      if @bibliography.save
        format.html { redirect_to course_bibliographies_path, notice: 'Bibliography was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bibliography }
      else
        format.html { render action: 'new' }
        format.json { render json: @bibliography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibliographies/1
  # PATCH/PUT /bibliographies/1.json
  def update
    respond_to do |format|
      if @bibliography.update(bibliography_params)
        format.html { redirect_to course_bibliographies_path, notice: 'Bibliography was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bibliography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliographies/1
  # DELETE /bibliographies/1.json
  def destroy
    @bibliography.destroy
    respond_to do |format|
      format.html { redirect_to course_bibliographies_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bibliography
      @course = Course.find(params[:course_id])
      @bibliography = Bibliography.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bibliography_params
      params.require(:bibliography).permit(:title, :user_id, :course_id)
    end
end
