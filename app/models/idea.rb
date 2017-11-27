class Idea < ApplicationRecord
    
    belongs_to :member, -> { where(role: 0) }
    has_and_belongs_to_many :sectors
    has_many :comments

    acts_as_votable
    acts_as_commentable
    geocoded_by :local
    reverse_geocoded_by :latitude, :longitude, :address => :local
    after_validation :geocode, if: ->(obj){ obj.local.present? and obj.local_changed? }
    after_validation :reverse_geocode, unless: ->(obj) { obj.local.present? },
                       if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }



    enum   kind: {proposal:0,complaint:1}
    validates :title, :describe,:kind, presence:true
end
