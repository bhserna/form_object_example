require "system_helper"

RSpec.describe "User adds expense" do
  scenario "successfully" do
    account = create :account

    visit account_path(account)

    click_on "Add Expense"

    select_date Date.current, from: "transaction_date"
    fill_in "Payee name", with: "Store"
    fill_in "Description", with: "Store outflow"
    fill_in "Amount", with: "100"
    click_on "Create"

    expect(page).to have_date Date.current
    expect(page).to have_target_name "Store"
    expect(page).to have_description "Store outflow"
    expect(page).to have_outflow "$100.00"
  end
end
