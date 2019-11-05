class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary = {}
    @recipes.map do |recipe|
      @summary[:name] = recipe.name
      @summary[:details] = recipe.ingredients
      @summary[:total_calories] = recipe.total_calories
    end
    summary
  end
end
