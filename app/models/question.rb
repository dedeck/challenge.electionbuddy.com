# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :election
  has_many :answers
  has_many :audits, as: :changed_attribute
end
