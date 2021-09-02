class Champion < ApplicationRecord
  validates :name, presence: true, length: { minimum:3, maximum: 20 }
  validates :region, presence: true
  validates :rol, presence: true
  validates :composition, presence: true
end
