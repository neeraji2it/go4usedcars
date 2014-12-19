class Admin::ImagesController < ApplicationController
  def new

    @vehicle = Vehicle.new
    if @vehicle.images.blank?
      @vehicle.images.build
    end


    @video = Video.new
    @vehicles = Vehicle.all
  end

  def create

    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.images.blank?
      @vehicle.images.build
    end
    @vehicles = Vehicle.all
    if @vehicle.save

    @vehicles = Vehicle.all
    @image = Image.new(image_params)
   
      redirect_to "/"
    else
      render :action => :new
    end
  end

  def create_video
    @vehicles = Vehicle.all
    @video = Video.new(video_params)
    if @video.save
      redirect_to "/"
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