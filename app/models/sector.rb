class Sector < ApplicationRecord
    has_and_belongs_to_many :ideas
    has_and_belongs_to_many :contests
    def name_with_initial
        "#{name}"
      end
end
