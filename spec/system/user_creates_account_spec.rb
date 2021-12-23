require "system_helper"

RSpec.describe "User creates account" do
  scenario "successfully" do
    visit root_path

    click_on "Add account"

    fill_in "Name", with: "My Bank account"
    click_on "Create"

    expect(page).to have_text "Account: My Bank account"
  end
end
