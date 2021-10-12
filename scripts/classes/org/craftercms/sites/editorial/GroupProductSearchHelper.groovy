package org.craftercms.sites.editorial

import org.apache.commons.lang3.StringUtils
import org.craftercms.engine.service.UrlTransformationService
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.elasticsearch.search.sort.FieldSortBuilder
import org.elasticsearch.search.sort.SortOrder

class GroupProductSearchHelper {
    static final String PRODUCT_CONTENT_TYPE_QUERY = "content-type:\"/page/spchitiet\""
    static final int DEFAULT_START = 0
    static final int DEFAULT_ROWS = 10000
    
    def elasticsearch
    UrlTransformationService urlTransformationService
    
     GroupProductSearchHelper(elasticsearch, UrlTransformationService urlTransformationService) {
        this.elasticsearch = elasticsearch
        this.urlTransformationService = urlTransformationService
    }
    
    def searchProducts(groupProduct, childProduct ,start = DEFAULT_START, rows = DEFAULT_ROWS, additionalCriteria = null) {
        def q = "${PRODUCT_CONTENT_TYPE_QUERY}"
        
        if (groupProduct) {
            def productGroupQuery = getFieldQueryWithMultipleValues("sptype_o.item.key", groupProduct)
            q = "${q} AND ${productGroupQuery}"
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
    
    def searchHotProducts(featured, start = DEFAULT_START, rows = DEFAULT_ROWS, additionalCriteria = null) {
        def q = "${PRODUCT_CONTENT_TYPE_QUERY}"
        if (featured) {
          q = "${q} AND isHot_b:true"
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
                    product.image1 = doc.image1_s
                    product.image2 = doc.image2_s
                    product.image3 = doc.image3_s
                    product.content = doc.content_html
                    product.kl = doc.kl_s
                    product.price = doc.price_s
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