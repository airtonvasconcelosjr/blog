# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  mount_uploaders :images, PostImageUploader

  private

  def delete_images_from_s3
    return unless images.present?

    images.each(&:remove!)
  end
end
