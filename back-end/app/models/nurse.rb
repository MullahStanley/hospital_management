class Nurse < ApplicationRecord
    has_many :patients through::doctor
end
