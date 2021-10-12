import org.craftercms.sites.editorial.RecuitSearchHelper
import org.craftercms.sites.editorial.PolicySearchHelper
def searchRecuit = new RecuitSearchHelper(elasticsearch, urlTransformationService)
def searchPolicy = new PolicySearchHelper(elasticsearch, urlTransformationService)
def recuits = searchRecuit.searchRecuit(null)
def policies = searchPolicy.searchPolicy(null, 0, 2)
println "Recuits:"
print recuits

templateModel.recuits = recuits
templateModel.policies = policies