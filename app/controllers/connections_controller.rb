class ConnectionsController < ApplicationController
    skip_before_action :authorized, only: :create
    def index
        render json: Connection.serialized_connections
    end

    def create
        connection = Connection.new(connection_params)
        if connection.save
            render json: {success: "connection successfully saved"}
        else
            render json: {error: "cannot save connection"}
        end
    end

    private

    def connection_params
        params.require(:connection).permit(:name, :email, :comment, :learn_about_jesus, :hear_about_church, :talk_to_pastor)
    end
end