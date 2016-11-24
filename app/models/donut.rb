class Donut < ActiveRecord::Base
  belongs_to :user
  has_many :fabs

  attr_reader :image

  validate :check_image



  IMAGE_TYPES =
    { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }

  def extension
    IMAGE_TYPES[content_type]
  end

  def image=(image)
    if image
      self.content_type = image.content_type
      self.data = image.read
      @image = image  #バリデーション用
    end
  end

  def check_image
    if @image
      if data.size > 512.kilobytes
        errors.add(:image, :too_big_image)
      end
      unless IMAGE_TYPES.has_key?(content_type)
        errors.add(:image, :invalid_image)
      end
    end
  end


  class << self
    def search(q)
      rel = all
      if q.present?
        rel = rel.where("title LIKE ? OR material LIKE ?", "%#{q}%", "%#{q}%")
      end
      rel
    end
  end
end
