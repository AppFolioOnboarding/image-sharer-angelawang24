require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_valid_img
    valid_url = 'https://cdn.pixabay.com/photo/2016/02/19/15/46/dog-1210559__340.jpg'
    valid_img = Image.new url: valid_url
    assert valid_img.save
  end

  def test_invalid_img
    invalid_img = Image.new url: 'https://www.google.com/'
    blank_url = Image.new url: ''
    invalid_jpg_url = Image.new url: 'jpg'
    assert_not invalid_img.save
    assert_not blank_url.save
    assert_not invalid_jpg_url.save

    assert_equal 'must be a valid URL', invalid_img.errors.messages[:url].first
    assert_equal 'must be a valid URL', blank_url.errors.messages[:url].first
    assert_equal "can't be blank", blank_url.errors.messages[:url].second
    assert_equal 'must be a valid URL', invalid_jpg_url.errors.messages[:url].first
  end

  def test_tags_saved_to_img
    valid_img_url = 'https://cdn.pixabay.com/photo/2016/02/19/15/46/dog-1210559__340.jpg'
    valid_img_tags = 'dog, animal'
    dog_img_with_tags = Image.new url: valid_img_url, tag_list: valid_img_tags
    assert dog_img_with_tags.save
    assert_equal valid_img_tags.split(', '), dog_img_with_tags.tag_list

    dog_img_no_tags = Image.new url: valid_img_url
    assert dog_img_no_tags.save
    assert_equal 0, dog_img_no_tags.tags.count
  end
end
