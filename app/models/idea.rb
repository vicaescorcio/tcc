class Idea < ApplicationRecord
    
    belongs_to :member, -> { where(role: 0) }
    has_and_belongs_to_many :sectors
    has_many :comments
    belongs_to :contests , optional: true

    acts_as_votable
    geocoded_by :local
    reverse_geocoded_by :latitude, :longitude, :address => :local
    after_validation :geocode, if: ->(obj){ obj.local.present? and obj.local_changed? }
    after_validation :reverse_geocode, unless: ->(obj) { obj.local.present? },
                       if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
    enum   kind: {proposal:0,complaint:1}
    validates :title, :describe,:kind, presence:true


    def self.locals
        locals = Array.new
        
        self.all.map  do |idea|
            coord = Array.new
            coord << idea.id
            if idea.longitude.nil? || idea.latitude.nil?
              coord << -3.71839
              coord << -38.5434
            else
              coord << idea.latitude
              coord << idea.longitude
            end
            locals << coord
        end
        locals
    end
end
