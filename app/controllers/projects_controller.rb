class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  rescue_from DataMapper::ObjectNotFoundError, with: :not_found

  def index
    @recent_closed_tickets = (Ticket.last_updated_since(Date.today - 1.week) & Ticket.closed).group_by { |t| t.updated_at.to_date }
  end

  def show
    @project = Project.get!(params[:id])
    @tickets = params[:closed_tickets] ? @project.closed_tickets : @project.open_tickets
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new((params[:project] || {}).slice(:title))

    if @project.save
      flash[:success] = 'Saved project.'
      redirect_to project_url(@project)
    else
      flash.now[:error] = 'Unable to save project.'
      render :new
    end
  end

  private

  def not_found
    flash[:error] = 'Unable to find project, please try again.'
    redirect_to projects_url
  end
end
