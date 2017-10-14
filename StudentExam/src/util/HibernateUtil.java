package util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
	
	private static final SessionFactory sessionFactory=buildSessionFactory();
	private static SessionFactory buildSessionFactory(){
		Configuration configuration=new Configuration().configure(); // 实例化配置文件
		ServiceRegistry serviceRegistry=new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build(); // 实例化服务登记
		SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry); // 获取Session工厂
	    return sessionFactory;
	}
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public static void main(String[] args) {
		HibernateUtil.getSessionFactory();
		
	}

}
