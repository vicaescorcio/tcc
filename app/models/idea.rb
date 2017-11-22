class Idea < ApplicationRecord
    
    belongs_to :member, -> { where(role: 0) }, dependent: :destroy
    has_and_belongs_to_many :sectors
    has_many :comments
    validates :title, :describe, presence:true
end
