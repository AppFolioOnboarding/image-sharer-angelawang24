require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_valid_img
    valid_img = Image.new url: images(:valid_img).url
    assert valid_img.save
  end

  def test_invalid_img
    invalid_img = Image.new url: images(:invalid_img).url
    blank_url = Image.new url: ''
    assert_not invalid_img.save
    assert_not blank_url.save
    assert_equal "is not a valid image url", invalid_img.errors.messages[:url].first
    assert_equal "is not a valid image url", blank_url.errors.messages[:url].first
    assert_equal "can't be blank", blank_url.errors.messages[:url].second
  end
end
