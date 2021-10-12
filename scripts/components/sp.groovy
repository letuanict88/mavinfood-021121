import org.craftercms.sites.editorial.GroupProductSearchHelper

def searchHelper = new GroupProductSearchHelper(elasticsearch, urlTransformationService)
def products = searchHelper.searchHotProducts(true,0,10)
templateModel.products = products