require "system_helper"

RSpec.describe "User adds inflow" do
  scenario "successfully" do
    account = create :account

    visit account_path(account)

    click_on "Add Inflow"

    fill_in "Payer name", with: "Job"
    fill_in "Description", with: "Job inflow"
    fill_in "Amount", with: "100"
    click_on "Create"

    expect(page).to have_target_name "Job"
    expect(page).to have_description "Job inflow"
    expect(page).to have_inflow "$100.00"
  end
end
