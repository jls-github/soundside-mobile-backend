class ApplicationController < ActionController::API
    before_action :authorized
    JWT_SECRET = Rails.application.credentials.secret_key_base

    def encode_token(payload)
        JWT.encode(payload, JWT_SECRET)
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, JWT_SECRET)
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            admin_id = decoded_token[0]['site_admin_id']
            begin
                @site_admin = SiteAdmin.find(admin_id)
            rescue ActiveRecord::RecordNotFound
                nil
            end
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { error: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
