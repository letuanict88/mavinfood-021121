package org.craftercms.sites.editorial

import org.apache.commons.lang3.StringUtils
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder

class EnNewsSearchHelper{
    static final String NEWS_CONTENT_TYPE ="content-type:\"/page/enpagetintuc\" "
    static final int DEFAULT_START = 0
    static final int DEFAULT_ROWS  = 1000
    
    def elasticsearch
    UrlTransformationService UrlTransformationService
    
    EnNewsSearchHelper(elasticsearch, UrlTransformationService urlTransformationService) {
        this.elasticsearch = elasticsearch
        this.urlTransformationService = urlTransformationService
    }
    
    def searchNews(categories, start = DEFAULT_START, rows = DEFAULT_ROWS, additionalCriteria = null){
        def q = "${NEWS_CONTENT_TYPE}"
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
            .sort(new FieldSortBuilder("date_dt").order(SortOrder.DESC))
        
        def result = elasticsearch.search(new SearchRequest().source(builder))

        if(result){
            return processNewsListingResults(result)
        }else{
            return[]
        }
    }
    def processNewsListingResults(result){
        def news = []
        def documents = result.hits.hits*.getSourceAsMap()
        if (documents){
            documents.each { doc ->
                def anews = [:]
                    anews.title = doc.title_s
                    anews.image = doc.image_s
                    anews.content = doc.content_html
                    anews.url = urlTransformationService.transform("storeUrlToRenderUrl", doc.localId)
                news << anews
            }
        }
        
        return news
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