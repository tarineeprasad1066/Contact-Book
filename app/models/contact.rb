class Contact < ApplicationRecord
  belongs_to :user
  
  validates :name, :email, :address, presence: true
  validates :phone, presence: true, uniqueness: true
end
