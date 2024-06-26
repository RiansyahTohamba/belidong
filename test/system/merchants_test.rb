require "application_system_test_case"

class MerchantsTest < ApplicationSystemTestCase
  setup do
    @merchant = merchants(:one)
  end

  test "visiting the index" do
    visit merchants_url
    assert_selector "h1", text: "Merchants"
  end

  test "should create merchant" do
    visit merchants_url
    click_on "New merchant"

    fill_in "Description", with: @merchant.description
    fill_in "Email", with: @merchant.email
    check "Has storefront" if @merchant.has_storefront
    fill_in "Logo", with: @merchant.logo
    fill_in "Owner name", with: @merchant.owner_name
    fill_in "Store name", with: @merchant.store_name
    click_on "Create Merchant"

    assert_text "Merchant was successfully created"
    click_on "Back"
  end

  test "should update Merchant" do
    visit merchant_url(@merchant)
    click_on "Edit this merchant", match: :first

    fill_in "Description", with: @merchant.description
    fill_in "Email", with: @merchant.email
    check "Has storefront" if @merchant.has_storefront
    fill_in "Logo", with: @merchant.logo
    fill_in "Owner name", with: @merchant.owner_name
    fill_in "Store name", with: @merchant.store_name
    click_on "Update Merchant"

    assert_text "Merchant was successfully updated"
    click_on "Back"
  end

  test "should destroy Merchant" do
    visit merchant_url(@merchant)
    click_on "Destroy this merchant", match: :first

    assert_text "Merchant was successfully destroyed"
  end
end
