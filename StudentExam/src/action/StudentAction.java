package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.PageBean;
import model.Student;

import org.apache.struts2.interceptor.ServletRequestAware;

import util.PageUtil;
import util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

import dao.StudentDao;

public class StudentAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private Student student;
	private String error;
	
	private StudentDao studentDao=new StudentDao();
	
	private String mainPage;
	private String id;
	private List<Student> studentList=new ArrayList<Student>();
	private String page;
	private int total;
	private String pageCode;
	private Student s_student;
	
	
	
	
	
	
	
	public Student getS_student() {
		return s_student;
	}
	public void setS_student(Student s_student) {
		this.s_student = s_student;
	}
	public List<Student> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getPageCode() {
		return pageCode;
	}
	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMainPage() {
		return mainPage;
	}
	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public StudentDao getStudentDao() {
		return studentDao;
	}
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	public String login() throws Exception{
		HttpSession session=request.getSession();
		Student currentUser=studentDao.login(student);
		if(currentUser==null){
			error="×¼¿¼Ö¤»òÃÜÂë´íÎó";
			return ERROR;
		}else{
			session.setAttribute("currentUser", currentUser);
			return SUCCESS;
		}
		
	}
	
	
	public String preUpdatePassword() throws Exception{
		mainPage="student/updatePassword.jsp";
		return SUCCESS;
		
	}
	
	public String updatePassword() throws Exception{
		Student s=studentDao.getStudentById(student.getId());
		s.setPassword(student.getPassword());
		studentDao.saveStudent(s);
		mainPage="student/updateSuccess.jsp";
		return SUCCESS;
	}
	
	public String logout()throws Exception{
		request.getSession().invalidate();
		return "logout";
	}
	
	public String list() throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		if(s_student==null){
			Object o=session.getAttribute("s_student");
			if(o!=null){
				s_student=(Student)o;
			}else{
				s_student=new Student();
			}
		}else{
			session.setAttribute("s_student", student);
		}
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),5);
		studentList=studentDao.studentList(pageBean,s_student);
		total=studentDao.studentCount(s_student);
		pageCode=PageUtil.genPagation(request.getContextPath()+"/student!list", total, Integer.parseInt(page), 5);
		mainPage="student/list.jsp";
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;		
	}
	

}
