class AddDateToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :date, :date
  end
end
