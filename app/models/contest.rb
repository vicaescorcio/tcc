class Contest < ApplicationRecord
    has_and_belongs_to_many :sectors
    belongs_to :member, -> { where(role: [1,2]) }, dependent: :destroy
    validates :title, :describe, presence:true
end
