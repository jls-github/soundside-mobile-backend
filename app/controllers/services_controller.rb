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


end
