class JavascriptsController < ApplicationController

def dynamic_category2s
  @category2s = Category2.find(:all)
@category3s = Category3.find(:all)
end


end
