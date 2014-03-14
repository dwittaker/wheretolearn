class JavascriptsController < ApplicationController

  def dynamic_category2s
    @category2s = Category2.find(:all)
  @category3s = Category3.find(:all)
  end

  def dynamic_subject_modules
    @subject_modules = SubjectModule.find(:all)

  end
end
