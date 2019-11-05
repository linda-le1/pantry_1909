class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock.empty?
      0
    else
      amount = @stock.keys.map do |item|
        item.name == ingredient.name
          @stock[ingredient]
        end
     amount.uniq.sum
    end
  end

  def restock(ingredient, amount)
    if @stock.has_key?(ingredient)
      @stock[ingredient] = @stock[ingredient] + amount
    else
      @stock[ingredient] = amount
    end
    @stock
  end

  def enough_ingredients_for?(recipe)
    ingredients_available = recipe.ingredients.keys.map do |ingredient|
     stock_check(ingredient) >= recipe.ingredients[ingredient]
     end
    ingredients_available.all?
  end
end
