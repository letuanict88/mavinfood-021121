import org.craftercms.sites.editorial.EnNewsSearchHelper
import org.craftercms.sites.editorial.EnRecipeSearchHelper
def searchNewsHelper = new EnNewsSearchHelper(elasticsearch, urlTransformationService)
def searchRecipe = new EnRecipeSearchHelper(elasticsearch, urlTransformationService)
def news = searchNewsHelper.searchNews(null, 0, 4)
def docs = searchRecipe.searchRecipe(null, 0, 2)
println "News:"

templateModel.news = news
templateModel.docs = docs