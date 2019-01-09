require 'open-uri'
require 'net/http'

class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    params.permit!
    @image = Image.new(params[:image])
    if is_valid_image? and @image.save
      redirect_to @image
    else
      @image.errors.add(:url, "is not a valid image url")
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def is_valid_image?
    valid_ending = ["jpeg", "jpg", "gif", "png"]
    return false if @image.url.nil?
    ending = @image.url.split('.').last
    valid_ending.include? ending
  end

end
