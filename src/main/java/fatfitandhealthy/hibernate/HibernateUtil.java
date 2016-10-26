package fatfitandhealthy.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final SessionFactory sessionFactory;
	static {
		Configuration configuration=new Configuration();
		configuration.configure("hibernate.cfg.xml");
		sessionFactory=configuration.configure().buildSessionFactory();
		
	}
	 public static Session openSession() {
	        return sessionFactory.openSession();
	    }
	 public static void close() {
		 System.out.println("called");
		sessionFactory.close();
	}
	 
}
