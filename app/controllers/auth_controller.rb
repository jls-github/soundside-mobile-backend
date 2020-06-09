class AuthController < ApplicationController

    def create
        @site_admin = SiteAdmin.find_by(username: login_params[:username])
        if @site_admin && @site_admin.authenticate(login_params[:password])
            token = encode_token({site_admin_id: @site_admin.id})
            render json: {token: token}, status: :accepted
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    private

    def login_params
        params.require(:site_admin).permit(:username, :password)
    end

end
