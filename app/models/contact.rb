class Contact < ApplicationRecord
  belongs_to :user
  
  validates :name, :address, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
end
