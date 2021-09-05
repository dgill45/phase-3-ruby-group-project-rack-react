class Member < ActiveRecord::Base
    has_many :comments,
    has_many :books, through: :comments
end