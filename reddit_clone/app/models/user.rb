class User < ApplicationRecord

    before_validation :ensure_session_token

    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    attr_reader :password

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

    def password=(password)
        self.password_digest ||= BCrypt::Password.create(password)
        @password = password
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    def reset_session_token!

        self.session_token = generate_unique_session_token
        self.save
        self.session_token
        
    end


end