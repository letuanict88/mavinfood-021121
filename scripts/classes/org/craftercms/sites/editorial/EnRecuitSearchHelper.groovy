package org.craftercms.sites.editorial

import org.apache.commons.lang3.StringUtils
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder

class EnRecuitSearchHelper {
    static final String RECUIT_CONTENT_TYPE_QUERY = "content-type:\"/page/enpagetuyendung\""
    static final int DEFAULT_START = 0
    static final int DEFAULT_ROWS = 1000
    
    def elasticsearch
    UrlTransformationService UrlTransformationService
    
    EnRecuitSearchHelper(elasticsearch, UrlTransformationService urlTransformationService) {
        this.elasticsearch = elasticsearch
        this.urlTransformationService = urlTransformationService
    }
    
    def searchRecuit(categories, start = DEFAULT_START, rows = DEFAULT_ROWS, additionalCriteria = null){
        def q = "${RECUIT_CONTENT_TYPE_QUERY}"
        if(categories){
            def categoriesQuery = getFieldQueryWithMultipleValues("categories_o.item.key",categories)
            q = "${q} AND ${categoriesQuery}"
        }
        
        if (additionalCriteria) {
          q = "${q} AND ${additionalCriteria}"
        }
        
        def builder = new SearchSourceBuilder()
            .query(QueryBuilders.queryStringQuery(q))
            .from(start)
            .size(rows)
        
        def result = elasticsearch.search(new SearchRequest().source(builder))

        if(result){
            return processRecuitListingResults(result)
        }else{
            return[]
        }
    }
    def processRecuitListingResults(result){
        def recuits = []
        def documents = result.hits.hits*.getSourceAsMap()
        if (documents){
            documents.each { doc ->
                def recuit = [:]
                    recuit.title = doc.title_s
                    recuit.content = doc.content_html
                    recuit.date = doc.date_dt
                    recuit.url = urlTransformationService.transform("storeUrlToRenderUrl", doc.localId)
                recuits << recuit
            }
        }
        
        return recuits
    }
    
    private def getFieldQueryWithMultipleValues(field, values) {
        if (values.class.isArray()) {
          values = values as List
        }
    
        if (values instanceof Iterable) {
          values = "(" + StringUtils.join((Iterable)values, " OR ") + ")"
        } else {
          values = "\"${values}\""
        }
    
        return "${field}:${values}"
    }
}