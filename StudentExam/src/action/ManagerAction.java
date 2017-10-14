package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;


import model.Manager;

import com.opensymphony.xwork2.ActionSupport;

import dao.ManagerDao;


public class ManagerAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ManagerDao managerDao=new ManagerDao();
	private Manager manager;
	private HttpServletRequest request;
	private String error;
	
	
	public ManagerDao getManagerDao() {
		return managerDao;
	}


	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}


	public Manager getManager() {
		return manager;
	}


	public void setManager(Manager manager) {
		this.manager = manager;
	}


	public String getError() {
		return error;
	}


	public void setError(String error) {
		this.error = error;
	}


	public String login(){
		HttpSession session=request.getSession();
		Manager currentUser=managerDao.login(manager);
		if(currentUser==null){
			error="用户名或密码错误";
			return ERROR;
		}else{
			session.setAttribute("currentUser", currentUser);
			return SUCCESS;
		}
	}
	
	public String logout() throws Exception{
		request.getSession().invalidate();
		return "logout";
	}


	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}

}
