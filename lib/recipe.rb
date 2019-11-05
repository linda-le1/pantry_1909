class Recipe
  attr_reader :name,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients = Hash.new
  end

  def ingredients_required
    @ingredients
  end

  def add_ingredient(name, amount)
    @ingredients[name] = amount
  end

  def amount_required(ingredient)
    ingredients_array = @ingredients.to_a
    amount = ingredients_array.find_all do |ingredient_element|
      ingredient_element[0].name == ingredient.name
    end.flatten
    amount[1]
  end

  def total_calories
     @ingredients.keys.map do |ingredient|
      ingredient.calories * amount_required(ingredient)
    end.sum
  end

  
end
