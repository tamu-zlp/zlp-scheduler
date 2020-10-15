class AddConflicts < ActiveRecord::Migration[5.0]
  def change
    create_table :conflicts do |t|
      t.references :user
      t.integer :cost
      t.references :course
      t.references :schedule
      t.references :time_slot
    end
    
    add_reference :time_slots, :conflicts
  end
end
