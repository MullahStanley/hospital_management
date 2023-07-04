class Patient < ApplicationRecord
    has_secure_password
    has_many :appointments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}
end
