class UserToken < ApplicationRecord
  belongs_to :user, polymorphic: true
end
