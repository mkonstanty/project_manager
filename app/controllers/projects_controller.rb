class ProjectsController < ApplicationController

  before_filter :login_required

  def index
    @memberships = Membership.find_all_by_user_id(current_user.id)
  end

  def show
    @project = Project.find(params[:id]) rescue nil

    # brak id lub projekt nie moj
    if @project.nil? || !@project.users.include?(current_user)
      redirect_to :controller => :projects, :action => 'index'
    end

    # ok - moj projekt
  end

  def edit
    unless request.post?
      @project = Project.find(params[:id])
    else
      @project = Project.find(params[:project][:id])
      @project.update_attributes(params[:project])

      redirect_to :controller => :projects, :action => :show, :id => @project.id
    end
  end

  def add_comment
    return unless (request.post? && params[:comment][:content] && params[:project][:id])
    comment = Comment.new
    comment.content = params[:comment][:content]
    comment.project_id = params[:project][:id]
    comment.user_id = current_user.id
    comment.save!
    
    redirect_to :controller => :projects, :action => :show, :id => params[:project][:id]
  end
end
