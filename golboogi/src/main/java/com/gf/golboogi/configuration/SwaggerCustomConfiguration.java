package com.gf.golboogi.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
public class SwaggerCustomConfiguration {

	//<bean id="api" class="springfox.documentation.spring.web.plugins.Docket"/>
	@Bean
	public Docket api() {
		return new Docket(DocumentationType.OAS_30)//문서화 유형 설정
							.select()//추임새 역할
								//.apis(RequestHandlerSelectors.any())//분석할 클래스 유형
								//.apis(RequestHandlerSelectors.basePackage("com.kh.spring18.rest"))
								.apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
								.paths(PathSelectors.any())//분석할 주소 유형
							.build()
								.apiInfo(//문서의 대표정보
									new ApiInfoBuilder()
													.title("문서의 제목")
													.description("문서의 설명")
													.version("0.0.1")
													.license("MIT License")
												.build()
									)
								.useDefaultResponseMessages(false)//기본메세지 OFF
								;
	}

}