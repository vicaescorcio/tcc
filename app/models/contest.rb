class Contest < ApplicationRecord
    has_and_belongs_to_many :sectors
    has_many :ideas
    belongs_to :member, -> { where(role: [1,2]) }
    validates :title, :describe, presence:true

    geocoded_by :local
    reverse_geocoded_by :latitude, :longitude, :address => :local
    after_validation :geocode, if: ->(obj){ obj.local.present? and obj.local_changed? }
    after_validation :reverse_geocode, unless: ->(obj) { obj.local.present? },
                       if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
                   
    scope :starts_with, -> (sector_ids) { where("sector_ids IN (?)", sector_ids)}


    def self.locals
        locals = Array.new
        
        self.all.map  do |contest|
            coord = Array.new
            coord << contest.title
            if contest.longitude.nil? || contest.latitude.nil?
              coord << -3.71839
              coord << -38.5434
            else
              coord << contest.latitude
              coord << contest.longitude
            end
            locals << coord
        end
        locals
    end


end
