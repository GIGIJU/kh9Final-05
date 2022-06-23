package com.gf.golboogi.configuration;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

@Configuration
public class MybatisConfiguration {
	
//	<bean id="factory" class="org.mybatis.spring.SqlSessionFactoryBean">
//		<property name="dataSource" ref="dbcpSource"></property>
//		<property name="configLocation" value="classpath:/mybatis/mybatis-config.xml"></property>
//		<property name="mapperLocations" value="classpath:/mybatis/mapper/**/*-mapper.xml"></property>
//	</bean>
	@Bean
	public SqlSessionFactoryBean factory(DataSource source, ApplicationContext ctx) throws IOException {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(source);
		bean.setConfigLocation(ctx.getResource("classpath:/mybatis/mybatis-config.xml"));
		bean.setMapperLocations(ctx.getResources("classpath:/mybatis/mapper/**/*-mapper.xml"));
		return bean;
	}
	
//	<bean id="template" class="org.mybatis.spring.SqlSessionTemplate">
//		<constructor-arg ref="factory"></constructor-arg>
//	</bean>
	@Bean
	public SqlSessionTemplate template(SqlSessionFactory factory) {
		SqlSessionTemplate template = new SqlSessionTemplate(factory);
		return template;
	}
	
}