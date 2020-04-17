class AddOpendateAndClosedateToTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :terms, :opendate, :datetime
    add_column :terms, :closedate, :datetime
  end
end
