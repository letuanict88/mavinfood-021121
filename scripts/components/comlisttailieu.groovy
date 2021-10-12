import org.craftercms.sites.editorial.DocSearchHelper
def searchHelper = new DocSearchHelper(elasticsearch, urlTransformationService)
def docs = searchHelper.searchDoc(null)
print docs

templateModel.docs = docs