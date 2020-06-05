class Service < ApplicationRecord
    belongs_to :church
    has_many :service_sections
    accepts_nested_attributes_for :service_sections

    def self.serialized_services
        Service.all.sort{|service| service.id}.map {|service| {
            date: service.date.strftime("%b %e"),
            id: service.id
        }}#should encrypt service_id? in the future
    end

    def serialized_sections #need to sort services by date, not id
        self.service_sections.map {|service_section| {
            title: service_section.title, 
            id: service_section.id,
            slides: service_section.slides.map {|slide| {
                title: slide.title ? slide.title : service_section.title, 
                content: slide.content, 
                id: slide.id}
            }.sort{|slide| -slide[:id] }
            }
        }.sort{|service_section| -service_section[:id] }
    end

end
