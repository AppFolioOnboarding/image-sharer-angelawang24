require 'open-uri'
require 'net/http'

class ImagesController < ApplicationController
  def index
    @images = if params[:tag]
                Image.tagged_with(params[:tag]).order(created_at: :desc)
              else
                Image.order(created_at: :desc)
              end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(create_params)
    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  def show
    @image = Image.find(image_params)
  end

  def destroy
    @image = Image.find(image_params)
    @image.destroy

    redirect_to images_path, notice: "Delete success"
  end

  protected

  def create_params
    params.require(:image).permit(:url, :tag_list)
  end

  def image_params
    params.require(:id)
  end
end
