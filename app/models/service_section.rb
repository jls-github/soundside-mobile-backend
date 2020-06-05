class ServiceSection < ApplicationRecord
  belongs_to :service
  has_many :slides
  accepts_nested_attributes_for :slides

end
