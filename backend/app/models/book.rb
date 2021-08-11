class Book < ActiveRecord::Base
    has_many :comments 
    has_many :members, through: :comments
end