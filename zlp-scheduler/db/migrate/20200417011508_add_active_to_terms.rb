class AddActiveToTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :terms, :active, :boolean
  end
end
