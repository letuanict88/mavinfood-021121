import org.craftercms.sites.editorial.NewsSearchHelper
def searchHelper = new NewsSearchHelper(elasticsearch, urlTransformationService)
def news = searchHelper.searchNews(null)
println "News:"
print news

templateModel.news = news