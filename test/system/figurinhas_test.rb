require "application_system_test_case"

class FigurinhasTest < ApplicationSystemTestCase
  setup do
    @figurinha = figurinhas(:one)
  end

  test "visiting the index" do
    visit figurinhas_url
    assert_selector "h1", text: "Figurinhas"
  end

  test "creating a Figurinha" do
    visit figurinhas_url
    click_on "New Figurinha"

    fill_in "Numero", with: @figurinha.numero
    fill_in "Quantidade", with: @figurinha.quantidade
    fill_in "User", with: @figurinha.user_id
    click_on "Create Figurinha"

    assert_text "Figurinha was successfully created"
    click_on "Back"
  end

  test "updating a Figurinha" do
    visit figurinhas_url
    click_on "Edit", match: :first

    fill_in "Numero", with: @figurinha.numero
    fill_in "Quantidade", with: @figurinha.quantidade
    fill_in "User", with: @figurinha.user_id
    click_on "Update Figurinha"

    assert_text "Figurinha was successfully updated"
    click_on "Back"
  end

  test "destroying a Figurinha" do
    visit figurinhas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Figurinha was successfully destroyed"
  end
end
