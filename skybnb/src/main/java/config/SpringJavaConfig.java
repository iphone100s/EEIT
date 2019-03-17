package config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

import model.bean.CustomerReportBean;
import model.bean.HouseInformationBean;
import model.bean.MemberBean;
import model.bean.OrderHouseBean;
import model.bean.WishListBean;


@Configuration
@ComponentScan(basePackages= {"model"})
public class SpringJavaConfig {
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource bundle = new ResourceBundleMessageSource();
		bundle.setBasename("controller.Errors");
		return bundle;
	}
	
	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		builder.addAnnotatedClasses(OrderHouseBean.class,MemberBean.class,HouseInformationBean.class,CustomerReportBean.class,WishListBean.class);
		
		Properties properties = new Properties();
		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		properties.put("show_sql", "true");
		properties.put("hibernate.current_session_context_class", "thread");
		builder.addProperties(properties);
				
		return builder.buildSessionFactory();
	}
	
	public DataSource dataSource() {
		try {
			JndiObjectFactoryBean bean = new JndiObjectFactoryBean();
			bean.setJndiName("java:comp/env/jdbc/skybnb");
			bean.setProxyInterface(DataSource.class);
			bean.afterPropertiesSet();
			return (DataSource) bean.getObject();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
		
	}
}
