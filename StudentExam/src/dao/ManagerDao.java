package dao;



import model.Manager;

import org.hibernate.Query;
import org.hibernate.Session;

import util.HibernateUtil;

public class ManagerDao {
	
	public Manager login(Manager manager){
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query=session.createQuery("from Manager as m where m.userName=:userName and m.password=:password");
		query.setString("userName", manager.getUserName());
		query.setString("password", manager.getPassword());
		Manager m=(Manager) query.uniqueResult();
		session.getTransaction().commit();
		return m;
	}

}
