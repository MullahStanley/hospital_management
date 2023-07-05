class Patient < ApplicationRecord
    has_secure_password

    has_many :appointments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}

    #This will enable generating a unique token for each patient during signup.
    def generate_token
        UserToken.create(user: self, token: SecureRandom.uuid)
    end

end
