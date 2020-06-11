class Service < ApplicationRecord
    belongs_to :church
    has_many :service_sections
    accepts_nested_attributes_for :service_sections
    validates :date, presence: true

    def self.serialized_services
        Service.order(date: :desc).map {|service| {
            date: service.date.strftime("%b %e"),
            id: service.id
        }}
        #should encrypt service_id? in the future
    end

    def self.closest_service
        @service = Service.all.sort_by {|service| (service.date.to_time - Date.today.to_time).abs }.first
        return {date: @service.date.strftime("%b %e"), id: @service.id}
    end

    def serialized_sections #need to sort services by date, not id
        return {
            date: self.date.strftime("%Y-%m-%d"), 
            sections: self.service_sections.order(id: :asc).map {|service_section| {
                title: service_section.title, 
                slides: service_section.slides.order(id: :asc).pluck(:title, :content).map{|title, content| {title: title, content: content}}
                }
            }
        }
    end

end
