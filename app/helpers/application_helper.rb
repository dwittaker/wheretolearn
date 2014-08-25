module ApplicationHelper

def javascript(*files)
  content_for(:head) { javascript_include_tag(*files) }
end

def stylesheet(*files)
  content_for(:head) { stylesheet_link_tag(*files) }
end


def can_display_subject(subject)
#signed_in? && !current_user.has_blocked?(subject.user) || !signed_in?
true
end 

  def link_to_remove_fields(name, f, options = {})
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", options)
  end

=begin
  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{ association }", :onsubmit => "return $(this.)validate();") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    link_to_function(name, "add_fields(this, \"#{ association }\", \"#{ escape_javascript(fields) }\")", options)
  end
=end

def link_to_remove_fields2(name, f)
  f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
end

def link_to_add_fields2(name, f, association, options = {})
  new_object = f.object.class.reflect_on_association(association).klass.new
  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    render(association.to_s.singularize + "_fields", :f => builder)
  end
  link_to_function(name, "add_fields2(this, \"#{association}\", \"#{escape_javascript(fields)}\")", options)
end

def add_subject_module_link(name)
  #link_to_function name do |page|
  page.insert_html :bottom, :tasks, :partial => 'subject_module', :object => Task.new
end

def flash_class(type)
  case type
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
  end
end

def listdt(dt)
  if !dt.nil?
    dt.strftime('%b %d, %Y')
  else
    ""
  end
end

def listdttm(dt)
  if !dt.nil?
    dt.strftime('%b %d, %y %H:%M %p' )
  else
    ""
  end

end

def longdttm(dt)
  if !dt.nil?
    dt.to_formatted_s(:long)
  else
    ""
  end
end

def title(page_title)
  content_for :title, page_title.to_s
end

def boolyesno(bool)
  if bool then
    "Yes"
  else
    "No"
  end
end

  def readdhttp(lnk)
    if lnk.include? "http://" or lnk.include? "https://"
      #lnk.gsub!("http://","")
      lnk
    else
      "http://#{lnk}"
    end

  end



end
