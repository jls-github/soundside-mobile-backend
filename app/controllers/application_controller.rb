class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, ENV['SECRET_KEY'])
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, ENV['SECRET_KEY'])
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
