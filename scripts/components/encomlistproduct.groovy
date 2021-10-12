import org.craftercms.sites.editorial.EnGroupProductSearchHelper
import org.craftercms.sites.editorial.TaxonomySearchHelper

def productGroup = contentModel.listproduct_s



def searchHelper = new EnGroupProductSearchHelper(elasticsearch, urlTransformationService)
def products = searchHelper.searchProducts(productGroup, productGroup, 0)

print productGroup

print products

templateModel.products = products