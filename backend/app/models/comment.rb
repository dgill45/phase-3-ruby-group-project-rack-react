class Comment < ActiveRecord::Base
    belongs_to :members
    belongs_to :books
end