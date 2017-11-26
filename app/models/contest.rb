class Contest < ApplicationRecord
    has_and_belongs_to_many :sectors
    belongs_to :member, -> { where(role: [1,2]) }
    validates :title, :describe, presence:true

    geocoded_by :local
    reverse_geocoded_by :latitude, :longitude, :address => :local
    after_validation :geocode, if: ->(obj){ obj.local.present? and obj.local_changed? }
    after_validation :reverse_geocode, unless: ->(obj) { obj.local.present? },
                       if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }


end
