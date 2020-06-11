class Slide < ApplicationRecord
  belongs_to :service_section
  validates :content, presence: true
  before_save :default_values


  def default_values
    self.title = self.section.title if self.title.nil?
  end
end
