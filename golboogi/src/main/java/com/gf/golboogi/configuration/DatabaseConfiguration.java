package com.gf.golboogi.configuration;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration//설정파일임을 명시. 어떠한 클래스보다 빨리 실행됨(프로젝트 준비단계)
//등록된 properties 중에서 원하는 접두사로 가져오는 기능(해당 변수에 setter 메소드가 필요)
@ConfigurationProperties(prefix = "custom.database")
@Setter
public class DatabaseConfiguration {
	
	private String driver, url, username, password;
	private int maxTotal, maxIdle, maxWait;

//	<bean id="dbcpSource" class="org.apache.commons.dbcp2.BasicDataSource">
//		<property name="driverClassName" value="${database.driver}"></property>
//		<property name="url" value="${database.url}"></property>
//		<property name="username" value="${database.username}"></property>
//		<property name="password" value="${database.password}"></property>
//		
//		<property name="maxTotal" value="${database.max-total}"></property>
//		<property name="maxIdle" value="${database.max-idle}"></property>
//		<property name="maxWaitMillis" value="${database.max-wait}"></property>
//	</bean>
	@Bean
	public BasicDataSource dbcpSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(driver);
		source.setUrl(url);
		source.setUsername(username);
		source.setPassword(password);
		
		source.setMaxTotal(maxTotal);
		source.setMaxIdle(maxIdle);
		source.setMaxWaitMillis(maxWait);
		return source;
	}
	
}