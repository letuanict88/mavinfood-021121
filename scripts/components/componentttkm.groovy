import org.craftercms.sites.editorial.CouponSearchHelper
def searchHelper = new CouponSearchHelper(elasticsearch, urlTransformationService)
def docs = searchHelper.searchCoupon(null)
print docs

templateModel.docs = docs