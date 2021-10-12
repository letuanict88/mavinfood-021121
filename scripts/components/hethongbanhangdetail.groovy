import org.craftercms.sites.editorial.AgencySearchHelper
def searchHelper = new AgencySearchHelper(elasticsearch, urlTransformationService)
def agency = searchHelper.searchAgency(null)
println "Dai ly:"
print agency

templateModel.recipes = agency