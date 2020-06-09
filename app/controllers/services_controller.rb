class ServicesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        render json: Service.serialized_services 
    end

    def show
        service = Service.find(params[:id])
        if service
            service_sections = service.serialized_sections
            render json: service_sections
        else
            render json: {error: "Couldn't find the service you were looking for"}
        end
    end

    def create
        service = Service.new(service_params)
        service[:church_id] = Church.first.id #this gives flexibility for future iterations of the app with multiple churches
        if service.save
            render json: {success: "Service successfully created"}
        else
            render json: {error: "Service could not be saved"}
        end
    end

    def update #putting rather than patching to maintain slide order and consistency
        old_service = Service.find(params[:id])
        new_service = Service.new(service_params)
        new_service[:church_id] = Church.first.id #this gives flexibility for future iterations of the app with multiple churches
        if new_service.save
            old_service.service_sections.each do |service_section|
                service_section.slides.each {|slide| slide.destroy}
                service_section.destroy
            end
            old_service.destroy
            render json: {success: 'Service successfully updated'}
        else
            render json: {error: 'Service could not be udpated'}
        end
    end

    def destroy
        service = Service.find(params[:id])
        if service
            service.service_sections.each do |service_section|
                service_section.slides.each {|slide| slide.destroy}
                service_section.destroy
            end
            service.destroy
            render json: {success: "Service successfully deleted"}
        else
            render json: {error: "Service not found"}
        end
    end

    private

    def service_params
        params.require(:service).permit(:title, :date, service_sections_attributes: [:title, slides_attributes: [:title, :content]])
    end
    
end
