package Util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class JPAConfig{
  @Bean
  public LocalEntityManagerFactoryBean getEntityManagerFactoryBean(){
    LocalEntityManagerFactoryBean factoryBean = new LocalEntityManagerFactoryBean();
    factoryBean.setPersistenceUnitName("PERSISTENCE");
    return factoryBean;
  }
  @Bean
  public JpaTransactionManager getJpaTransactionManager(){
    JpaTransactionManager transactionManager = new JpaTransactionManager();
    transactionManager.setEntityManagerFactory(getEntityManagerFactoryBean().getObject());
    return transactionManager;
  }
}
