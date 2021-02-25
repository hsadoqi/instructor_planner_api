class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, presence: true, length: { minimum: 2 }
    validates :email, presence: true, uniqueness: { case_sensitive: false}
    validates :password, confirmation: true, length: { in: 6..20 }
    validates :password_confirmation, presence: true

end
