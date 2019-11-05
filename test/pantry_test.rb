require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require './lib/ingredient'
require './lib/pantry'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_it_starts_out_empty
    pantry = Pantry.new
    assert_equal ({}), pantry.stock
  end

  def test_it_starts_out_empty
    cheese = Ingredient.new("Cheese", "C", 50)
    pantry = Pantry.new
    assert_equal 0, pantry.stock_check(cheese)
  end

  def test_it_can_restock
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    pantry = Pantry.new

    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    pantry.restock(mac, 7)

    assert_equal 15, pantry.stock_check(cheese)
    assert_equal 7, pantry.stock_check(mac)
  end

  def test_it_can_check_if_enough_ingredients
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    pantry = Pantry.new

    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    pantry.restock(mac, 7)

    assert_equal false, pantry.enough_ingredients_for?(mac_and_cheese)

    pantry.restock(mac, 1)

    assert_equal true, pantry.enough_ingredients_for?(mac_and_cheese)
  end

end
