class Image < ApplicationRecord
  def is_valid_image?
    valid_ending = ["jpeg", "jpg", "gif", "png"]
    return false if url.nil?
    ending = url.split('.').last
    valid_ending.include? ending
  end
end
