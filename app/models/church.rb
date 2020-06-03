class Church < ApplicationRecord
    has_many :site_admins
    has_many :services
end
