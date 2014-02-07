class SubjectsController < ApplicationController
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
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    #params[:subject][:existing_subject_module_attributes] ||= {}
    #params[:subject][:existing_subject_module_attributes] ||= {}

    #@subject.subject_modules = Subjectmodule.find(params[:subject_module])
    #@subject.subject_modules = SubjectModule.find(params[:subject_id])
    @subject = Subject.find(params[:id])
    #@subject.update_attributes({:subject_modules_attributes => params[:subject][:subject_modules_attributes]})

    #@subject_modules = SubjectModule.find(params[:subject][:subject_modules_attributes][:id])
    #@subject.subject_modules = SubjectModule.find(params[:subject][:subject_modules_attributes])
    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        #@subject_modules = SubjectModule.new(params[:subject][:subject_modules_attributes])

        #@subject.subject_modules = @subject_modules
        #@subject_modules.save
        #@subject.subject_modules.update_attributes(params[:subject][:subject_modules_attributes])
        if @subject.save
          format.html { redirect_to @subject, notice: 'Subject and Module(s) successfully updated.' }
          format.json { head :no_content }
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
