class UpdateChildrenToLatest < ActiveRecord::Migration[7.0]
  def change
    # Do not run this migration on production or on existing data. It is a
    # destructive migration. Remove child records before running.
    raise "Child records exist, cannot run migration" if Child.any?

    remove_column :children, :full_name, :text

    change_table :children, bulk: true do |t|
      t.integer :sex
      t.text :first_name
      t.text :last_name
      t.text :preferred_name
      t.integer :gp
      t.integer :screening
      t.integer :consent
      t.integer :seen
    end
  end
end
