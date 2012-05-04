class TicketsController < ApplicationController

  before_filter :authenticate_user!, :find_project

  def new
    @ticket = @project.tickets.new
  end

  def create
    @ticket = @project.tickets.new((params[:ticket] || {}).slice(:title))

    if @ticket.save
      flash[:success] = 'Saved ticket.'
      redirect_to project_url(@project)
    else
      flash.now[:error] = 'Unable to save ticket.'
      render :new
    end
  end

  def update
    @ticket = @project.tickets.get!(params[:id])

    if @ticket.update((params[:ticket] || {}).slice(:status))
      flash[:success] = "#{params[:ticket][:status] == 'closed' ? 'Closed' : 'Reopened'} ticket."
    else
      flash[:error] = "Unable to update ticket: #{@ticket.errors.full_messages.join(', ')}."
    end
    redirect_to project_url(@project)
  end

  private

  def find_project
    @project = Project.get!(params[:project_id])
  end
end
