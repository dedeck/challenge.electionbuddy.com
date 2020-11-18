class CreateAudits < ActiveRecord::Migration[6.0]
  def change
    create_table :audits do |t|
      t.references :election
      t.references :changed_attribute, polymorphic: true, index: false
      t.string :value_changed
      t.string :previous_value
      t.string :new_value
      t.references :user
      t.timestamp :changed_timestamp

      t.timestamps
    end

    #default generated index name from line 5 is too long, add manually and keep name short
    add_index :audits, [:changed_attribute_type, :changed_attribute_id], name: 'audits_changed_attribute_index'
  end
end
