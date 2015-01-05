class Admin::ImagesController < ApplicationController
  before_filter :authenticate_admin!
  def new
    @vehicle = Vehicle.new
    
    if @vehicle.images.blank?
      @vehicle.images.build
    end

    @video = Video.new
    @vehicles = Vehicle.all
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
   
    @vehicles = Vehicle.all
    if @vehicle.update_attributes(vehicle_params)
      redirect_to new_admin_image_path
    else
      render :action => :new
    end
  end

  def create_video
    @vehicles = Vehicle.all
    @video = Video.new(video_params)
    if @video.save
      redirect_to new_admin_image_path
    else
      render :action => :new
    end
  end

  private
  def image_params
    params.require(:image).permit!
  end 

  def video_params
    params.require(:video).permit!
  end

  def vehicle_params
    params.require(:vehicle).permit(:id, images_attributes: [:id, :vehicle_id, :image, :_destroy])
  end
end