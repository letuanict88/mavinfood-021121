import org.craftercms.sites.editorial.SuperMarketSearchHelper

def searchHelper = new SuperMarketSearchHelper(elasticsearch, urlTransformationService)

def adailys = searchHelper.searchProducts(params.q)
adailys.each{ adaily ->
 if (adaily.highlight != null) {
      adaily.highlight = adaily.highlight.replaceAll("\\<.*?\\>", "");
      if (adaily.highlight.length() > 100) {
            adaily.highlight = adailys.highlight.substring(0,100)
            adaily.highlight += "..."
        }
 }
}

return adailys