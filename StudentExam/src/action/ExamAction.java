package action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Exam;
import model.PageBean;
import model.Question;

import org.apache.struts2.interceptor.ServletRequestAware;

import util.PageUtil;
import util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

import dao.ExamDao;
import dao.QuestionDao;

public class ExamAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Exam> examList=new ArrayList<Exam>();
	private ExamDao examDao=new ExamDao();
	private Exam s_exam;
	private Exam exam;
	private String mainPage;
	private HttpServletRequest request;
	private String page;
	
	private int total;
	private String pageCode;
	private QuestionDao questionDao=new QuestionDao();
	
	
	
	

	public Exam getExam() {
		return exam;
	}


	public void setExam(Exam exam) {
		this.exam = exam;
	}


	public QuestionDao getQuestionDao() {
		return questionDao;
	}


	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}


	public String getPageCode() {
		return pageCode;
	}


	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}


	public List<Exam> getExamList() {
		return examList;
	}


	public void setExamList(List<Exam> examList) {
		this.examList = examList;
	}


	public ExamDao getExamDao() {
		return examDao;
	}


	public void setExamDao(ExamDao examDao) {
		this.examDao = examDao;
	}


	public Exam getS_exam() {
		return s_exam;
	}


	public void setS_exam(Exam s_exam) {
		this.s_exam = s_exam;
	}


	public String getMainPage() {
		return mainPage;
	}


	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}


	public String getExams() throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		if(s_exam==null){
			Object o=session.getAttribute("s_exam");
			if(o!=null){
				s_exam=(Exam)o;
			}else{
				s_exam=new Exam();
			}
		}else{
			session.setAttribute("s_exam", s_exam);
		}
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),5);
		examList=examDao.getUserExamList(s_exam, pageBean);
		total=examDao.examCount(s_exam);
		pageCode=PageUtil.genPagation(request.getContextPath()+"/exam!getExams", total, Integer.parseInt(page), 5);
		mainPage="exam/myExam.jsp";
		return SUCCESS;
	}
	
	private int calScore(String questionId,String userAnswer,String type) throws Exception{
		Question question=questionDao.getQuestion(questionId);
		if(userAnswer.equals(question.getAnswer())){
			if("1".equals(question.getType())){
				return 20;
			}else{
				return 30;
			}
		}else{
			return 0;
		}
	}
	
	public String addScore() throws Exception{
		Map<String,String[]> keyMap=request.getParameterMap();
		Iterator<Entry<String,String[]>> it2=keyMap.entrySet().iterator();
		int totalScore=0;
		int singleScore=0;
		int moreScore=0;
		while(it2.hasNext()){
			Entry<String,String[]> entry=it2.next();
			String keyStr=entry.getKey();
			String values[]=entry.getValue();
			String key="";
			String value="";
			if(keyStr.equals("exam.student.id")||keyStr.equals("exam.paper.id")){
				continue;
			}
			if(keyStr.split("-")[1].equals("r")){ // 单选题目
				key=keyStr.split("-")[2];
				value=values[0];
				singleScore+=this.calScore(key, value, "1");
			}else{  // 多选
				key=keyStr.split("-")[2];
				for(String s:values){
					value+=s+",";
				}
				value=value.substring(0, value.length()-1);
				moreScore+=this.calScore(key, value, "2");
			}
		}
		totalScore=singleScore+moreScore;
		exam.setSingleScore(singleScore);
		exam.setMoreScore(moreScore);
		exam.setScore(totalScore);
		exam.setExamDate(new Date());
		
		examDao.saveExam(exam);
		mainPage="exam/examResult.jsp";
		return SUCCESS;
	}
	
	public String list() throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}if(s_exam==null){
			Object o=session.getAttribute("s_exam");
			if(o!=null){
				s_exam=(Exam)o;
			}else{
				s_exam=new Exam();
			}
		}else{
			session.setAttribute("s_exam", s_exam);
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),5);
		examList=examDao.getUserExamList(s_exam, pageBean);
		total=examDao.examCount(s_exam);
		pageCode=PageUtil.genPagation(request.getContextPath()+"/exam!list", total, Integer.parseInt(page), 5);
		mainPage="exam/list.jsp";
		return SUCCESS;
	}


	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
}
