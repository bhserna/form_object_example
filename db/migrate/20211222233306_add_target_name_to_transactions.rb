class AddTargetNameToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :target_name, :string
  end
end
