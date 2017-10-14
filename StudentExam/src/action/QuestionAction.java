package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.PageBean;
import model.Paper;
import model.Question;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import util.PageUtil;
import util.ResponseUtil;
import util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

import dao.PaperDao;
import dao.QuestionDao;


public class QuestionAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private QuestionDao questionDao=new QuestionDao();
	private HttpServletRequest request;
	private String page;
	private Question s_question;
	private int total;
	private List<Question> questionList=new ArrayList<>();
	private String pageCode;
	private String mainPage;
	private String questionId;
	private Question question;
	private String title;
	private PaperDao paperDao=new PaperDao();
	private List<Paper> paperList=new ArrayList<>();
	
	
	
	
	
	
	public PaperDao getPaperDao() {
		return paperDao;
	}

	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}

	public List<Paper> getPaperList() {
		return paperList;
	}

	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	public QuestionDao getQuestionDao() {
		return questionDao;
	}

	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public Question getS_question() {
		return s_question;
	}

	public void setS_question(Question s_question) {
		this.s_question = s_question;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String list() throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		if(s_question==null){
			Object o=session.getAttribute("s_question");
			if(o!=null){
				s_question=(Question)o;
			}else{
				s_question=new Question();
			}
		}else{
			session.setAttribute("s_question", s_question);
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),5);
		questionList=questionDao.getQuestions(s_question, pageBean);
		total=questionDao.questionCount(s_question);
		pageCode=PageUtil.genPagation(request.getContextPath()+"/question!list", total, Integer.parseInt(page), 5);
		mainPage = "question/questionList.jsp";
		return SUCCESS;		
	}

	
	
	public String getQuestionById() throws Exception{
		question=questionDao.getQuestionById(questionId);
		mainPage="question/questionShow.jsp";
		return SUCCESS;
		
	}
	
	public String preSave() throws Exception{
		paperList=paperDao.getPaperList();
		if(StringUtil.isNotEmpty(questionId)){
			question=questionDao.getQuestion(questionId);
			title="修改试题";
		}else{
			title="添加试题";
		}
		mainPage="question/questionWrite.jsp";
		return SUCCESS;
	}
	
	public String save() throws Exception{
		if(StringUtil.isNotEmpty(questionId)){
			question.setId(Integer.parseInt(questionId));
		}
		questionDao.saveQuestion(question);
		return "save";
		
	}
	
	public String delete()throws Exception{
		question=questionDao.getQuestion(questionId);
		questionDao.deleteQuestion(question);
		JSONObject result= new JSONObject();
		result.put("success", true);
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;		
	}
	

}
