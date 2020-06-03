class ServiceSection < ApplicationRecord
  belongs_to :service
  has_many :slides
end
