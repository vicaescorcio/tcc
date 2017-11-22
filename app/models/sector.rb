class Sector < ApplicationRecord
    has_and_belongs_to_many :ideas
    has_and_belongs_to_many :contests
end
