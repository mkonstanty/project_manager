class Admin::ProjectsController < ApplicationController
before_filter :admin_required  
    active_scaffold :project do |project| 
    project.columns=[:name, :description, :created_at, :due_date]
    create.columns=[:name, :description, :due_date]
    update.columns=[:name, :description, :due_date]
    show.columns=[:name, :description, :due_date]
    #project.columns[:users].ui_type = :select 
  end
  
end
