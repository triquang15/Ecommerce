package com.triquang.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;

import com.triquang.entity.Category;
import com.triquang.entity.Product;

@Configuration
public class DataRestConfig implements RepositoryRestConfigurer {

	public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {

		HttpMethod[] theUnsupportedActions = { HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE };

		// disable HTTP methods for Products: PUT, POST, DELETE
		config.getExposureConfiguration().forDomainType(Product.class)
				.withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
				.withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions));
		
		// disable HTTP methods for Category: PUT, POST, DELETE
				config.getExposureConfiguration().forDomainType(Category.class)
						.withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
						.withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions));

	}

}
