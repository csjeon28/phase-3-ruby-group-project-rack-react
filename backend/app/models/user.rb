class User < ActiveRecord::Base
    has_many :boards
    has_many :wishes, through: :boards
end
