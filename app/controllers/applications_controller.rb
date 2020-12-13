class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to applications_show_path(application.id)
    else
      flash[:notice] = "Application not created: Required information missing."
      render :new
    end
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip, :description)
  end
end