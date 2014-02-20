class SubjectModulesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  # GET /subject_modules
  # GET /subject_modules.json
  def index
    @subject_modules = SubjectModule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subject_modules }
    end
  end

  # GET /subject_modules/1
  # GET /subject_modules/1.json
  def show
    @subject_module = SubjectModule.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject_module }
    end
  end

  # GET /subject_modules/new
  # GET /subject_modules/new.json
  def new
    @subject_module = SubjectModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject_module }
    end
  end

  # GET /subject_modules/1/edit
  def edit
    @subject_module = SubjectModule.find(params[:id])
  end

  # POST /subject_modules
  # POST /subject_modules.json
  def create
    @subject_module = SubjectModule.new(params[:subject_module])

    respond_to do |format|
      if @subject_module.save
        format.html { redirect_to @subject_module, notice: 'Subject module was successfully created.' }
        format.json { render json: @subject_module, status: :created, location: @subject_module }
      else
        format.html { render action: "new" }
        format.json { render json: @subject_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subject_modules/1
  # PUT /subject_modules/1.json
  def update
    #@subject_module = SubjectModule.find(params[:id])
@subject_module = SubjectModule.find(params[@subject])

    respond_to do |format|
      if @subject_module.update_attributes(params[:subject_module])
        format.html { redirect_to @subject_module, notice: 'Subject module was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_modules/1
  # DELETE /subject_modules/1.json
  def destroy
    @subject_module = SubjectModule.find(params[:id])
    @subject_module.destroy

    respond_to do |format|
      format.html { redirect_to subject_modules_url }
      format.json { head :no_content }
    end
  end

def subject_module_fields
end 
end
