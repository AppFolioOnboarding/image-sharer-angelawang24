require 'open-uri'
require 'net/http'

class ImagesController < ApplicationController
  def index
    @images = Image.order(created_at: :desc)
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
    @image = Image.find(params[:id])
  end

  protected

  def create_params
    params.require(:image).permit(:url, :tag_list)
  end
end
