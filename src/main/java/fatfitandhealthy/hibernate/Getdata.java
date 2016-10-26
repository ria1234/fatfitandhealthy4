package fatfitandhealthy.hibernate;
import java.util.List;
import fatfitandhealthy.dao.*;





import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Getdata {

	public Getdata(){}
	public static List getData(String s) {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try{
		transaction=session.beginTransaction();
		Query query=session.createQuery("from "+s);
		return query.list();
		}finally{
			System.out.println("finally called");
			transaction.commit();
			session.close();
		}
	}
	public static List onecolumnvaluewhere(String s,String c,String v){
		Session session=HibernateUtil.openSession();
		Transaction transaction=session.beginTransaction();
		try{
		Query query=session.createQuery("from "+s+" where "+c+" = '"+v+"'");
		return query.list();
		}
		finally {
			transaction.commit();
			session.close();
		}
		
	}
	public static void save(Object o) {
		System.out.println("save method");
		Session s=HibernateUtil.openSession();
		Transaction t=null;
		try {
			t=s.beginTransaction();
			s.save(o);
			t.commit();
			System.out.println("save method try");
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			t.rollback();
		}
		finally {
			s.close();
		}
	}
	public static void delete(String table,String column,int id) {
		Session s=HibernateUtil.openSession();
		Transaction t=null;
		try {
			t=s.beginTransaction();
			Query query=s.createQuery("delete from "+table+" where "+column+" = :CId");
			query.setParameter("CId", id);
			query.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
		}
		finally {
			t.commit();
			s.close();
		}
	}
	public static void update(Object obj) {
		Session s=HibernateUtil.openSession();
		Transaction t=null;
		try {
			t=s.beginTransaction();
			s.update(obj);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			t.commit();
			s.close();
		}
	}
}
