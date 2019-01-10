class Image < ApplicationRecord
  def valid_image?
    valid_ending = %w[jpeg jpg gif png]
    return false if url.nil?
    ending = url.split('.').last
    valid_ending.include? ending
  end
end
