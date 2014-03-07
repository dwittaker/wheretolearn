class SubjectsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new
    @subject.subject_modules.build
    #@subject.build_subject_modules

    #1.times { @subject.subject_modules.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
    @subject_modules = @subject.subject_modules
   # 4.times {@subject_modules.build}
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        if @subject.subject_modules.count == 0
          savegeneralmodule(@subject)
        end
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def savegeneralmodule(newsub)
    @genmod = newsub.subject_modules.new

    @genmod.smname = 'General'
    @genmod.smdescription = 'Basic description of the subject'
    @genmod.order = 1
    @genmod.smpurpose = 'This is the main item related to the subject'


    @genmod.save!
  end


  # PUT /subjects/1
  # PUT /subjects/1.json
  def update

    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])

        if @subject.save
          format.html { redirect_to @subject, notice: 'Subject and Module(s) successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end

      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  def subject_module_fields 
  end
end
