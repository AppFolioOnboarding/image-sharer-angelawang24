require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_valid_img
    valid_img = Image.new url: images(:valid_img).url
    assert valid_img.save
  end

  def test_invalid_img
    invalid_img = Image.new url: images(:invalid_img).url
    blank_url = Image.new url: ''
    invalid_jpg_url = Image.new url: images(:invalid_jpg_url).url
    assert_not invalid_img.save
    assert_not blank_url.save
    assert_not invalid_jpg_url.save

    assert_equal 'is not a valid image url', invalid_img.errors.messages[:url].first
    assert_equal 'is not a valid image url', blank_url.errors.messages[:url].first
    assert_equal "can't be blank", blank_url.errors.messages[:url].second
    assert_equal 'is not a valid image url', invalid_jpg_url.errors.messages[:url].first
  end

  def test_tags_saved_to_img
    dog_img_with_tags = Image.new url: images(:valid_img).url, tag_list: images(:valid_img).tags
    assert dog_img_with_tags.save
    assert_equal images(:valid_img).tag_list, dog_img_with_tags.tags

    dog_img_no_tags = Image.new url: images(:valid_img).url
    assert dog_img_no_tags.save
    puts dog_img_no_tags.tags
    assert_equal 0, dog_img_no_tags.tags.count
  end
end
