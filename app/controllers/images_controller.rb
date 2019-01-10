require 'open-uri'
require 'net/http'

class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.create
  end

  def create
    params.permit!
    @image = Image.new(params[:image])
    if @image.valid_image? && @image.save
      redirect_to @image
    else
      @image.errors.add(:url, 'is not a valid image url')
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end
end
