import org.craftercms.sites.editorial.ProductSkuSearchHelper

def searchHelper = new ProductSkuSearchHelper(elasticsearch, urlTransformationService)

def data = params.q
def products = searchHelper.searchProducts(params.q)
products.each{ item ->
 if (item.sku != null) {
   if (data != item.sku) {
       return []
   }
 }
}
return [products]