class Audit < ApplicationRecord
  belongs_to :election
  belongs_to :changed_attribute, polymorphic: true
end
