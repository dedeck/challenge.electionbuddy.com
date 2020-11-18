# frozen_string_literal: true

class Voter < ApplicationRecord
  belongs_to :election
  has_many :audits, as: :changed_attribute
end
