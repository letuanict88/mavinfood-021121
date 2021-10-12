import org.craftercms.sites.editorial.EnRecipeSearchHelper
def searchHelper = new EnRecipeSearchHelper(elasticsearch, urlTransformationService)
def recipes = searchHelper.searchRecipe(null, 0, 2)
println "Recipes:"
print recipes

templateModel.recipes = recipes