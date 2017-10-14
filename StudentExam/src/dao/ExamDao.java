package dao;

import java.math.BigInteger;
import java.util.List;

import model.Exam;
import model.PageBean;

import org.hibernate.Query;
import org.hibernate.Session;

import util.HibernateUtil;
import util.StringUtil;

public class ExamDao {
	
	public List<Exam> getUserExamList(Exam s_exam,PageBean pageBean) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sb=new StringBuffer("from Exam exam");
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getId())){
			sb.append(" and exam.student.id='"+s_exam.getStudent().getId()+"'");
		}
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getName())){
			sb.append(" and exam.student.name like '%"+s_exam.getStudent().getName()+"%'");
		}
		String sql=sb.toString().replaceFirst("and", "where");
		Query query=session.createQuery(sql);
		if(pageBean!=null){
			query.setFirstResult(pageBean.getStart());
			query.setMaxResults(pageBean.getPageSize());
		}
		@SuppressWarnings("unchecked")
		List<Exam> examList=query.list();
		session.getTransaction().commit();
		return examList;
	}
	
	public int examCount(Exam s_exam) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sb=new StringBuffer("select count(*) from t_exam t1,t_student t2 where t1.studentId=t2.id");
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getId())){
			sb.append(" and t2.id='"+s_exam.getStudent().getId()+"'");
		}
		if(s_exam.getStudent()!=null&&StringUtil.isNotEmpty(s_exam.getStudent().getName())){
			sb.append(" and t2.name like '%"+s_exam.getStudent().getName()+"%'");
		}
		Query query=session.createSQLQuery(sb.toString());
		int count=((BigInteger)query.uniqueResult()).intValue();
		session.getTransaction().commit();
		return count;
	}
	
	public void saveExam(Exam exam)throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(exam);
		session.getTransaction().commit();
	}
	
}
