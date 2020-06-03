class Service < ApplicationRecord
    belongs_to :church
    has_many :service_sections

    def self.serialized_services
        Service.all.sort{|service| service.id}.map {|service| {
            date: service.date.strftime("%b %e"),
            id: service.id
        }}#should encrypt service_id? in the future
    end

    def serialized_sections #change the order of the sorting so that you sort first, then map. that way, you don't have to send the id over in the fetch
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
