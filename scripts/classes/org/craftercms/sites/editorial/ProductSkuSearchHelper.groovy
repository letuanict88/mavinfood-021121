package org.craftercms.sites.editorial

import org.apache.commons.lang3.StringUtils
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder

class ProductSkuSearchHelper {
    static final String PRODUCT_CONTENT_TYPE_QUERY = "content-type:\"/page/spchitiet\""
    static final int DEFAULT_START = 0
    static final int DEFAULT_ROWS = 1
    
    def elasticsearch
    UrlTransformationService urlTransformationService
    
     ProductSkuSearchHelper(elasticsearch, UrlTransformationService urlTransformationService) {
        this.elasticsearch = elasticsearch
        this.urlTransformationService = urlTransformationService
    }
    
    def searchProducts(sku ,start = DEFAULT_START, rows = DEFAULT_ROWS, additionalCriteria = null) {
        def q = "${PRODUCT_CONTENT_TYPE_QUERY}"
        
        if (sku) {
            if(!sku.contains(" ")) {
                sku = "${sku}~1 OR *${sku}*"
            }
            
            def skuQuery = "(sku_s:(${sku}))"
            q = "${q} AND ${skuQuery}"
        }
        
        if (additionalCriteria) {
          q = "${q} AND ${additionalCriteria}"
        }
        
        def builder = new SearchSourceBuilder()
            .query(QueryBuilders.queryStringQuery(q))
            .from(start)
            .size(rows)
        
        def result = elasticsearch.search(new SearchRequest().source(builder))
        
        if (result) {
            return processProductListingResults(result)
        } else {
            result [];
        }
    }
    
    
    private def processProductListingResults(result) {
        def products = []
        
        def documents = result.hits.hits*.getSourceAsMap()
        
        if (documents) {
            documents.each {doc ->
                def product = [:]
                    product.name = doc.name_s
                    product.sku = doc.sku_s
                    product.url = urlTransformationService.transform("storeUrlToRenderUrl", doc.localId)
                products << product
            }
        }
        
        return products
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