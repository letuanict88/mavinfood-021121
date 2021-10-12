import org.craftercms.sites.editorial.RecipeSearchHelper
def searchHelper = new RecipeSearchHelper(elasticsearch, urlTransformationService)
def recipes = searchHelper.searchRecipe(null, 0, 2)
println "Recipes:"
print recipes

templateModel.recipes = recipes