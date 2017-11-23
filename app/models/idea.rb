class Idea < ApplicationRecord
    
    belongs_to :member, -> { where(role: 0) }, dependent: :destroy
    has_and_belongs_to_many :sectors
    has_many :comments
    acts_as_votable
    enum   kind: {proposal:0,complaint:1}
    validates :title, :describe,:kind, presence:true
end
