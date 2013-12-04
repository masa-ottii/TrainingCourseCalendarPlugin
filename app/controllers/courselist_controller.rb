# -*- coding: utf-8 -*-
class CourselistController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:project_id])
  end
 
  def list
    t_id = Setting.plugin_course_list['traker_on_cal']
    color_field = Setting.plugin_course_list['color_field']
    place_field = Setting.plugin_course_list['place_field']

    issue_list = Issue.where(tracker_id: t_id)
    events = Array.new
    issue_list.each do |issue|
      e = Event.new
      e.title = issue.subject
      e.description = issue.description
      # 場所を指定するカスタムフィールドより場所の値(value)を取得
      place_values = issue.custom_values.select{|c|c.custom_field_id == place_field.to_i}.first
      e.place = place_values.value if place_values
      # 担当者を取得
      e.assigned = issue.assigned_to.lastname if issue.assigned_to 
      # URLはこのチケット単独のページに指定
      e.url = "issues/#{issue.id}"
      # チケット色を指定するカスタムフィールドより色の値(value)を取得
      color_values = issue.custom_values.select{|c|c.custom_field_id == color_field.to_i}.first
      color_values.value.match(/.+(#[a-zA-Z0-9]{6})./) if color_values
      e.color = $1 #正規表現にマッチした色指定用文字列(例：#112233)を設定  
      e.start_date = (issue.start_date).to_time
      e.end_date = (issue.due_date).to_time
      events << e
    end
    render :json => events
  end

end
