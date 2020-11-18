# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  has_many :audits, as: :changed_attribute
end
