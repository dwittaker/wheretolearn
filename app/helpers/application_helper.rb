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




end
