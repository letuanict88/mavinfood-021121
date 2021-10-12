import org.craftercms.sites.editorial.NewsSearchHelper
import org.craftercms.sites.editorial.RecipeSearchHelper
def searchNewsHelper = new NewsSearchHelper(elasticsearch, urlTransformationService)
def searchRecipe = new RecipeSearchHelper(elasticsearch, urlTransformationService)
def news = searchNewsHelper.searchNews(null, 0, 4)
def docs = searchRecipe.searchRecipe(null, 0, 2)
println "News:"

templateModel.news = news
templateModel.docs = docs