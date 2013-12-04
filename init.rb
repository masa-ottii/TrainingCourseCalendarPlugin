# -*- coding: utf-8 -*-
Redmine::Plugin.register :course_list do
  name 'コース実施カレンダー プラグイン'
  author 'Ochi Masao'
  description 'This is a plugin for Redmine'
  version '0.1.1'
  url 'http://www.casareal.co.jp'
  author_url 'http://wwww.casareal.co.jp'

  project_module :Course_List do
    permission :courselist, { :courselist => [:index] }, :public => true
  end
  menu :project_menu, :courselist, { :controller => 'courselist', :action => 'index' }, 
                                     :caption => 'コース実施カレンダー', :after => :wiki, :param => :project_id
  settings :default => {'display_truker' => 1}, :partial => 'settings/courselist_settings'
end
