import org.craftercms.sites.editorial.EnNewsSearchHelper
def searchHelper = new EnNewsSearchHelper(elasticsearch, urlTransformationService)
def news = searchHelper.searchNews(null)
println "News:"
print news

templateModel.news = news