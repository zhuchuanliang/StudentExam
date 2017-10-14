package dao;

import java.util.List;

import model.Paper;

import org.hibernate.Query;
import org.hibernate.Session;

import util.HibernateUtil;

public class PaperDao {
	@SuppressWarnings("unchecked")
	public List<Paper> getPaperList() throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query=session.createQuery("from Paper");
		
		List<Paper> paperList=query.list();
		session.getTransaction().commit();
		return paperList;
	}
	
	public Paper getPaper(String paperId) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Paper paper=(Paper) session.get(Paper.class, Integer.parseInt(paperId));
		session.getTransaction().commit();
		return paper;
	}
	
	public void savePaper(Paper paper) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(paper);
		session.getTransaction().commit();
	}
	public void deletePaper(Paper paper) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.delete(paper);
		session.getTransaction().commit();
	}

}
