import org.craftercms.sites.editorial.EnGroupProductSearchHelper
import org.craftercms.sites.editorial.TaxonomySearchHelper

def productGroup = contentModel.sptype_o.item.key

def searchHelper = new EnGroupProductSearchHelper(elasticsearch, urlTransformationService)
def relatedProducts = searchHelper.searchProducts(productGroup.text,0)
def categories = new TaxonomySearchHelper("nhom-sp", elasticsearch, siteItemService)
						.getItems()

templateModel.productOther = relatedProducts
templateModel.categories = categories