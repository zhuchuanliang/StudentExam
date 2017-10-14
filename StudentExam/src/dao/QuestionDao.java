package dao;

import java.math.BigInteger;
import java.util.List;

import model.PageBean;
import model.Question;

import org.hibernate.Query;
import org.hibernate.Session;

import util.HibernateUtil;
import util.StringUtil;

public class QuestionDao {
	public Question getQuestion(String questionId){
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Question question=(Question) session.get(Question.class, Integer.parseInt(questionId));
		session.getTransaction().commit();
		return question;
	}
	
	public boolean existQuestionByPaperId(String paperId){
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query=session.createQuery("from Question as q where q.paper.id=:paperId");
		query.setString("paperId", paperId);
		@SuppressWarnings("unchecked")
		List<Question> questionList=query.list();
		session.getTransaction().commit();
		if(questionList.size()>0){
			return true;
		}else{
			return false;
		}
		
	}
	
	public List<Question> getQuestions(Question s_question,PageBean pageBean) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sb=new StringBuffer("from Question");
		if(StringUtil.isNotEmpty(s_question.getSubject())){
			sb.append(" where subject like '%"+s_question.getSubject()+"%'");
		}
		Query query=session.createQuery(sb.toString());
		if(pageBean!=null){
			query.setFirstResult(pageBean.getStart());
			query.setMaxResults(pageBean.getPageSize());
		}
		@SuppressWarnings("unchecked")
		List<Question> questionList=query.list();
		session.getTransaction().commit();
		return questionList;
	}
	
	public int questionCount(Question s_question) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		StringBuffer sb=new StringBuffer("select count(*) from t_question");
		if(StringUtil.isNotEmpty(s_question.getSubject())){
			sb.append(" where subject like '%"+s_question.getSubject()+"%'");
		}
		Query query=session.createSQLQuery(sb.toString());
		int total=((BigInteger)query.uniqueResult()).intValue();
		session.getTransaction().commit();
		return total;
	}
	
	public Question getQuestionById(String questionId) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query=session.createQuery("from Question where id=:questionId");
		query.setString("questionId", questionId);
		Question question=(Question) query.uniqueResult();
		session.getTransaction().commit();
		return question;
	}
	
	public void saveQuestion(Question question) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.merge(question);
		session.getTransaction().commit();
	}
	
	public void deleteQuestion(Question question) throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.delete(question);
		session.getTransaction().commit();
	}

}
