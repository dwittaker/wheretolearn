module ApplicationHelper

def can_display_subject(subject)
#signed_in? && !current_user.has_blocked?(subject.user) || !signed_in?
true
end 

end
