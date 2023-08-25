class Contact < ApplicationRecord
  self.per_page = 4
  belongs_to :user
  
  validates :name, :email, :phone, :address, presence: true
  has_one_attached :image

  def image_as_thumbnail
    image.variant(resize_to_limit: [300, 300]).processed
  end
end
