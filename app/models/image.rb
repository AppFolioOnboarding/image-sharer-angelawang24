class Image < ApplicationRecord
  validate :valid_image?
  validates :url, presence: true
  acts_as_taggable_on :tags

  private

  def valid_image?
    valid_ending = %w[jpeg jpg gif png]
    ending = url.split('.').last
    is_valid_url = URI.parse(url).is_a?(URI::HTTP)
    errors.add(:url, 'is not a valid image url') unless is_valid_url && valid_ending.include?(ending)
  end
end
