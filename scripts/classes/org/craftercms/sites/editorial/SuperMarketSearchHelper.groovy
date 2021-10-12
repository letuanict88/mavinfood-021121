package org.craftercms.blueprints.headless
import org.apache.commons.lang3.StringUtils
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder
import java.math.*; 

class SearchMarketHelper {
    static final String NEWS_CONTENT_TYPE ="content-type:\"/page/pagemarketchitiet\" "
    static final String[] NEWS_CONTENT_HIGHLIGHT_FIELDS = ["name_s", "address_s"]
    static final int DEFAULT_START = 0
    static final int DEFAULT_ROWS = 10000
    
    def elasticsearch
    UrlTransformationService urlTransformationService
    
    SearchMarketHelper(elasticsearch, UrlTransformationService urlTransformationService) {
        this.elasticsearch = elasticsearch
        this.urlTransformationService = urlTransformationService
    }
    
    def searchProducts(String userTerm ,start = DEFAULT_START, rows = DEFAULT_ROWS, additionalCriteria = null) {
        def q = "${NEWS_CONTENT_TYPE}"
        
        if (userTerm) {
            if(!userTerm.contains(" ")) {
                userTerm = "${userTerm}~1 OR *${userTerm}*"
            }
            
            def userTermQuery = "(name_s:(${userTerm}) OR address_s:(${userTerm}))"
            q = "${q} AND ${userTermQuery}"
        }
        
        def highlighter = SearchSourceBuilder.highlight()
        NEWS_CONTENT_HIGHLIGHT_FIELDS.each{ field -> highlighter.field(field) }
        
        def builder = new SearchSourceBuilder()
          .query(QueryBuilders.queryStringQuery(q))
          .from(start)
          .size(rows)
          .highlighter(highlighter)
        
        def result = elasticsearch.search(new SearchRequest().source(builder))
        
        if (result) {
          return processUserSearchResults(result)
        } else {
          return []
        }
    }
    
    def processUserSearchResults(result) {
        def adailys = []
        def hits = result.hits.hits
        
        if (hits) {
            hits.each { hit -> 
                def doc = hit.getSourceAsMap()
                
                 def adaily = [:]
                    adaily.name = doc.name_s
                    adaily.phone = doc.phone_s
                    adaily.address = doc.address_s
                    adaily.longitude = new BigDecimal(doc.longitude_s)
                    adaily.latitude = new BigDecimal(doc.latitude_s)
                    
                if (hit.highlightFields) {
                    def adailyHighlights = hit.highlightFields.values()*.getFragments().flatten()*.string()
                    
                    if (adailyHighlights) {
                        def highlightValues = []
                        
                        adailyHighlights.each { value -> 
                            highlightValues = value
                        }
                        
                        adaily.highlight = StringUtils.join(highlightValues, "... ")
                        adaily.highlight = StringUtils.strip(adaily.highlight)
                    }
                }
                
                adailys << adaily
            }
        }
      return adailys 
    }
}