package kh.spring.configurator;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class ApplicationContextProvider implements ApplicationContextAware{
	
	private static ApplicationContext spring;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.spring = applicationContext;
	}
	
	public static ApplicationContext getApplicationContext() {
		return spring;
	}
}
