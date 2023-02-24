class Sub < ApplicationRecord
    has_many :posts,
        dependent: :destroy
    has_many :users,
        through: :posts,
        source: :author
        
end
