package dao;

import java.math.BigInteger;
import java.util.List;

import model.PageBean;
import model.Student;

import org.hibernate.Query;
import org.hibernate.Session;

import util.HibernateUtil;
import util.StringUtil;

public class StudentDao {
	public Student login(Student student) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query=session.createQuery("from Student as s where s.id=:id and s.password=:password");
		query.setString("id", student.getId());
		query.setString("password", student.getPassword());
		Student resultStu=(Student) query.uniqueResult();
		session.getTransaction().commit();
		return resultStu;
	}
	
	public Student getStudentById(String id) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Student student=(Student) session.get(Student.class, id);
		session.getTransaction().commit();
		return student;
	}
	
	public void saveStudent(Student student) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(student);
		session.getTransaction().commit();
	}
	
	public List<Student> studentList(PageBean pageBean,Student s_student) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sb=new StringBuffer("from Student");
		if(StringUtil.isNotEmpty(s_student.getName())){
			sb.append(" and name like '%"+s_student.getName()+"%'");
		}
		if(StringUtil.isNotEmpty(s_student.getId())){
			sb.append(" and id='"+s_student.getId()+"'");
		}
		Query query=session.createQuery(sb.toString().replaceFirst("and", "where"));
		if(pageBean!=null){
			query.setFirstResult(pageBean.getStart());
			query.setMaxResults(pageBean.getPageSize());
		}		
		@SuppressWarnings("unchecked")
		List<Student> studentList=(List<Student>)query.list();
		session.getTransaction().commit();
		return studentList;
		
	}
	
	public int studentCount(Student s_student) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sb=new StringBuffer("select count(*) from t_student");
		if(StringUtil.isNotEmpty(s_student.getName())){
			sb.append(" and name like '%"+s_student.getName()+"%'");
		}
		if(StringUtil.isNotEmpty(s_student.getId())){
			sb.append(" and id='"+s_student.getId()+"'");
		}
		Query query=session.createSQLQuery(sb.toString().replaceFirst("and", "where"));
		int total=((BigInteger)query.uniqueResult()).intValue();
		session.getTransaction().commit();
		return total;
	}

}
