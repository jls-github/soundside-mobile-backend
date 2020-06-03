class SiteAdmin < ApplicationRecord
  belongs_to :church
  has_secure_password
end
