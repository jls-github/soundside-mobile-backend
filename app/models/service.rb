class Service < ApplicationRecord
    belongs_to :church
    has_many :service_sections

    def self.serialized_services
        Service.all.map {|service| {date: service.date, id: service.id}} #should encrypt this in the future
    end

    def serialized_sections
        self.service_sections.map {|service_section| {
            title: service_section.title, 
            id: service_section.id,
            slides: service_section.slides.map {|slide| {title: slide.title ? slide.title : service_section.title, content: slide.content, id: slide.id}}.sort{|slide| -slide[:id] }
            }
        }.sort{|service_section| -service_section[:id] }
    end

end
