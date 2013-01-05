class ProjectsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def new
    @project = Project.new
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project destroyed."
    redirect_to users_url
  end
end