package fatfitandhealthy.hibernate;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import fatfitandhealthy.dao.*;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

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
	public static double calcuatecalgoal(String dob,String gender,String weight,String height,String activity_factor,String weight_goal,String kgs) {
		float age=Float.valueOf(new SimpleDateFormat("yyyy").format(new Date()))-Float.valueOf(dob.substring(6));
		double bmr,daily_cal_goal;
		if (gender.equals("male")) {
			bmr=(10*Float.valueOf(weight))+(6.25*Float.valueOf(height))-5*age+5;
			//System.out.println(bmr);
		} else {
			bmr=(10*Float.valueOf(weight))+(6.25*Float.valueOf(height))-5*age-161;
			//System.out.println(bmr);
		}
		if (activity_factor.equals("sedentary")) {
			daily_cal_goal=bmr*1.2;
			//System.out.println(daily_cal_goal);
		} else if (activity_factor.equals("lightly active")) {
			daily_cal_goal=bmr*1.375;
		}else if (activity_factor.equals("moderetly active")) {
			daily_cal_goal=bmr*1.55;
		}else if (activity_factor.equals("very active")) {
			daily_cal_goal=bmr*1.725;
		}else {
			daily_cal_goal=bmr*1.9;
		}
		//System.out.println(daily_cal_goal);
		if (weight_goal.equals("gain weight")) {
			if (kgs.equals("0.5")) {
				daily_cal_goal=daily_cal_goal+550;
			}
			else {
				daily_cal_goal=daily_cal_goal+300;
			}
		}
		else if (weight_goal.equals("loose weight")) {
			if (kgs.equals("0.5")) {
				daily_cal_goal=daily_cal_goal-550;
			}
			else {
				daily_cal_goal=daily_cal_goal-300;
			}
		}
		return daily_cal_goal;
		
	}
	
	public static List twocolumnvaluewhere(String s,String c1,String v1,String c2,String v2){
		Session session=HibernateUtil.openSession();
		Transaction transaction=session.beginTransaction();
		try{
		Query query=session.createQuery("from "+s+" where "+c1+" = '"+v1+"' and "+c2+" = '"+v2+"'");
		return query.list();
		}
		finally {
			transaction.commit();
			session.close();
		}
		
	}
	
	public static List lastnrecord(Class t, String c, int n,String c1,Object v1) {
		Session session=HibernateUtil.openSession();
		Transaction transaction=session.beginTransaction();
		try{
		Criteria criteria=session.createCriteria(t);
		criteria.add(Restrictions.eq(c1, v1));
		criteria.addOrder(Order.desc(c));
		criteria.setMaxResults(n);
		List l=criteria.list();
		return l;
		
		}
		finally{
			transaction.commit();
			session.close();
		}
		
	}
}
