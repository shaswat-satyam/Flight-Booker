require "application_system_test_case"

class AirportsTest < ApplicationSystemTestCase
  setup do
    @airport = airports(:one)
  end

  test "visiting the index" do
    visit airports_url
    assert_selector "h1", text: "Airports"
  end

  test "should create airport" do
    visit airports_url
    click_on "New airport"

    click_on "Create Airport"

    assert_text "Airport was successfully created"
    click_on "Back"
  end

  test "should update Airport" do
    visit airport_url(@airport)
    click_on "Edit this airport", match: :first

    click_on "Update Airport"

    assert_text "Airport was successfully updated"
    click_on "Back"
  end

  test "should destroy Airport" do
    visit airport_url(@airport)
    click_on "Destroy this airport", match: :first

    assert_text "Airport was successfully destroyed"
  end
end
