class Admin::MembershipsController < ApplicationController

  before_filter :admin_required
  active_scaffold :membership do |config|
     config.columns=[:user, :project]
     config.columns[:user].ui_type = :select 
     config.columns[:project].ui_type = :select
  end
  
  
end
