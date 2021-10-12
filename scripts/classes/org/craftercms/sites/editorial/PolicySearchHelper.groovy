package org.craftercms.sites.editorial

import org.apache.commons.lang3.StringUtils
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder

class PolicySearchHelper{
    static final String POLICY_CONTENT_TYPE ="content-type:\"/page/chinhsachdetail\" "
    static final int DEFAULT_START = 0
    static final int DEFAULT_ROWS  = 1000
    
    def elasticsearch
    UrlTransformationService UrlTransformationService
    
    PolicySearchHelper(elasticsearch, UrlTransformationService urlTransformationService) {
        this.elasticsearch = elasticsearch
        this.urlTransformationService = urlTransformationService
    }
    
    def searchPolicy(categories, start = DEFAULT_START, rows = DEFAULT_ROWS, additionalCriteria = null){
        def q = "${POLICY_CONTENT_TYPE}"
        
        if (additionalCriteria) {
          q = "${q} AND ${additionalCriteria}"
        }
        
        def builder = new SearchSourceBuilder()
            .query(QueryBuilders.queryStringQuery(q))
            .from(start)
            .size(rows)
            .sort(new FieldSortBuilder("date_dt").order(SortOrder.DESC))
        
        def result = elasticsearch.search(new SearchRequest().source(builder))

        if(result){
            return processPolicyListingResults(result)
        }else{
            return[]
        }
    }
    def processPolicyListingResults(result){
        def policies = []
        def documents = result.hits.hits*.getSourceAsMap()
        if (documents){
            documents.each { doc ->
                def policy = [:]
                    policy.title = doc.title_s
                    policy.image = doc.image_s
                    policy.content = doc.content_html
                    policy.url = urlTransformationService.transform("storeUrlToRenderUrl", doc.localId)
                policies << policy
            }
        }
        
        return policies
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