class Contest < ApplicationRecord
    has_and_belongs_to_many :sectors
    belongs_to :member, -> { where(role: [1,2]) }
    validates :title, :describe, presence:true
end
