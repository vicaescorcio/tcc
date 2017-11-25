class Comment < ApplicationRecord
   belongs_to :idea
    #belongs_to :member,-> {where(role:[0,2])},dependent: :destroy
end
