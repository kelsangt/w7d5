class UsersController < ApplicationController
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user 
        else 
            nil 
        end
    end

    def identify_password?(password)
        bcypt_obj = BCrypt::Password.new(self.password_digest)
        bcypt_obj.is_password?(password)
    end

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64 
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64 
        end
        token
    end

end
