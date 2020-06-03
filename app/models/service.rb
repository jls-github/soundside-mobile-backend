class Service < ApplicationRecord
    belongs_to :church
    has_many :service_sections
end
