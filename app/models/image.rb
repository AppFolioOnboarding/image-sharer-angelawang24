class Image < ApplicationRecord
  validate :valid_image?
  validates :url, presence: true

  private

  def valid_image?
    valid_ending = %w[jpeg jpg gif png]
    ending = url.split('.').last
    errors.add(:url, 'is not a valid image url') unless valid_ending.include? ending
  end
end
