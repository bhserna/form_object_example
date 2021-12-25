require "system_helper"

RSpec.describe "User adds transfer" do
  scenario "successfully" do
    account1 = create :account
    account2 = create :account
    create :transaction, account: account1, amount: 200

    visit account_path(account1)

    click_on "Add Transfer"

    select_date Date.current, from: "transfer_date"
    select account2.name, from: "Target account"
    fill_in "Amount", with: "100"
    click_on "Create"

    expect(page).to have_date Date.current
    expect(page).to have_target_name account2.name
    expect(page).to have_description "Transfer to #{account2.name}"
    expect(page).to have_outflow "$100.00"

    visit account_path(account2)
    expect(page).to have_date Date.current
    expect(page).to have_target_name account1.name
    expect(page).to have_description "Transfer from #{account1.name}"
    expect(page).to have_inflow "$100.00"
  end
end
