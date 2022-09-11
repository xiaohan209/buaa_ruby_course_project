require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Color", with: @product.color_id
    fill_in "Description", with: @product.description
    fill_in "Design", with: @product.design_id
    fill_in "Favorites", with: @product.favorites
    fill_in "Gender", with: @product.gender
    fill_in "Image directory", with: @product.image_directory
    fill_in "Product name", with: @product.product_name
    fill_in "Product type", with: @product.product_type_id
    fill_in "Retail price", with: @product.retail_price
    fill_in "Sales", with: @product.sales
    fill_in "Size", with: @product.size_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Color", with: @product.color_id
    fill_in "Description", with: @product.description
    fill_in "Design", with: @product.design_id
    fill_in "Favorites", with: @product.favorites
    fill_in "Gender", with: @product.gender
    fill_in "Image directory", with: @product.image_directory
    fill_in "Product name", with: @product.product_name
    fill_in "Product type", with: @product.product_type_id
    fill_in "Retail price", with: @product.retail_price
    fill_in "Sales", with: @product.sales
    fill_in "Size", with: @product.size_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
