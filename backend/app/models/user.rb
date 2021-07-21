class User < ActiveRecord::Base
    has_many :boards
    has_many :items
end