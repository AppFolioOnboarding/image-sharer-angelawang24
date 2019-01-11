require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.create!(url: 'https://cdn.pixabay.com/photo/2016/02/19/15/46/dog-1210559__340.jpg')
  end

  def test_index
    get images_url

    assert_response :ok
  end

  def test_show
    get image_path(@image.id)

    assert_response :ok
  end

  def test_new
    get new_image_path

    assert_response :ok
  end

  def test_create__succeed
    assert_difference('Image.count', 1) do
      image_params = { url: 'https://cdn.pixabay.com/photo/2016/02/19/15/46/dog-1210559__340.jpg' }
      post images_path, params: { image: image_params }
    end

    assert_redirected_to image_path(Image.last.id)
    assert_equal 'Image was successfully created.', flash[:notice]
  end

  def test_create__fail
    assert_no_difference('Image.count') do
      image_params = { url: 'google.com' }
      post images_path, params: { image: image_params }
    end

    assert_response :ok
  end
end
