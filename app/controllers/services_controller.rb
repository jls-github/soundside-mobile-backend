class ServicesController < ApplicationController

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
        byebug
        service = Service.new(service_params)
        if service.save
            render json: {success: "Service successfully created"}
        else
            render json: {error: "Service could not be saved"}
        end
    end

    def update #putting rather than patching to maintain slide order and consistency
        old_service = Service.find(params[:id])
        new_service = service.new(service_params)
        if new_service.save
            old_service.slides.each {|slide| slide.destroy}
            old_service.destroy
            render json: {success: 'Service successfully updated'}
        else
            render json: {error: 'Service could not be udpated'}
        end
    end

    def delete
        service = Service.find(params[:id])
        if service
            if service.slides
                service.slides.each {|slide| slide.destroy}
            end
            service.destroy
            render json: {success: "Service successfully deleted"}
        else
            render json: {error: "Service not found"}
        end
    end

    private

    def service_params
        params.require(:service).permit(:title, :date, service_section_attributes: [:title, slide_attributes: [:title, :content]])
    end
    
end
