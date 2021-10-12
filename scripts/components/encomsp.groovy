import org.craftercms.sites.editorial.EnGroupProductSearchHelper

def searchHelper = new EnGroupProductSearchHelper(elasticsearch, urlTransformationService)
def products = searchHelper.searchHotProducts(true,0,10)
templateModel.products = products