# frozen_string_literal: true

class Election < ApplicationRecord
  has_many :questions
  belongs_to :user
  has_many :audits
  has_many :audits, as: :changed_attribute

  before_save :add_audit
  serialize :settings, Hash

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end

  def add_audit
    if self.changed?
      timestamp = Time.now
      self.changed.each do |attribute|
        Audit.create(election: self, changed_attribute: self, value_changed: attribute,
                     previous_value: self.changed_attributes[attribute],
                     new_value: self.attributes[attribute],changed_timestamp: timestamp,
                     user_id: Current.user.id)
      end
    end
  end
end
