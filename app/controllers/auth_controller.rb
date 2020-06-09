class AuthController < ApplicationController
    skip_before_action :authorized, only: :create

    def create
        @site_admin = SiteAdmin.find_by(username: login_params[:username])
        if @site_admin && @site_admin.authenticate(login_params[:password])
            token = encode_token({site_admin_id: @site_admin.id})
            render json: {token: token}, status: :accepted
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    def validate
        render json: {message: "user valid"}
    end

    private

    def login_params
        params.require(:site_admin).permit(:username, :password)
    end

end
