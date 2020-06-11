class Slide < ApplicationRecord
  belongs_to :service_section
  validates :content, presence: true
end
