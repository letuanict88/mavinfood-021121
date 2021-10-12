import org.craftercms.sites.editorial.GroupProductSearchHelper
import org.craftercms.sites.editorial.TaxonomySearchHelper

def productGroup = contentModel.listproduct_s



def searchHelper = new GroupProductSearchHelper(elasticsearch, urlTransformationService)
def products = searchHelper.searchProducts(productGroup, productGroup, 0)

print productGroup

print products

templateModel.products = products