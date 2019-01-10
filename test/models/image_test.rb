require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  fixtures :images

  def test_valid_img
    valid_img = Image.new url: images(:valid_img).url
    assert valid_img.save
    assert valid_img.valid_image?
  end

  def test_invalid_img
    invalid_img = Image.new url: images(:invalid_img).url
    assert_not invalid_img.valid_image?
  end
end
