# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'course_cal',:to =>"courselist#index"
get 'course_event',:to=>"courselist#list"
