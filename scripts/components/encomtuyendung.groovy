import org.craftercms.sites.editorial.EnRecuitSearchHelper
import org.craftercms.sites.editorial.EnPolicySearchHelper
def searchRecuit = new EnRecuitSearchHelper(elasticsearch, urlTransformationService)
def searchPolicy = new EnPolicySearchHelper(elasticsearch, urlTransformationService)
def recuits = searchRecuit.searchRecuit(null)
def policies = searchPolicy.searchPolicy(null, 0, 2)
println "Recuits:"
print recuits

templateModel.recuits = recuits
templateModel.policies = policies