class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    if params[:search]
      @selected = Pet.search(params[:search])
    end
    if params[:adopt]
      chosen = Pet.find(params[:pet_id])
      pet_app = PetApplication.create!(pet_id: chosen.id, application_id: @application.id)
    end
    if params[:description] != nil
      @application.update(status: "Pending")
    end
  end

  def new
  end
 
  def create
    application = Application.new(application_params)
    if application.save
      redirect_to applications_show_path(application.id)
    else
      flash.now[:notice] = "Application not created: Required information missing."
      render :new
    end
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip, :description, :status)
  end
end