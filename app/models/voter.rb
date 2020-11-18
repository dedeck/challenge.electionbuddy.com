# frozen_string_literal: true

class Voter < ApplicationRecord
  belongs_to :election
  has_many :audits, as: :changed_attribute

  before_save :add_audit

  def add_audit
    return if self.new_record?
    if self.changed?
      timestamp = Time.now
      self.changed.each do |attribute|
        Audit.create(election: self.election, changed_attribute: self, value_changed: attribute,
                     previous_value: self.changed_attributes[attribute],
                     new_value: self.attributes[attribute],changed_timestamp: timestamp,
                     user_id: Current.user.id)
      end
    end
  end
end
