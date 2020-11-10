class AddChosenTimeToCohort < ActiveRecord::Migration[5.0]
  def change
    add_column :cohorts, :chosen_time, :datetime
  end
end
