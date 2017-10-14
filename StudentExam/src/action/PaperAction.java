package action;


import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import model.Paper;
import model.Question;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import util.ResponseUtil;
import util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

import dao.PaperDao;
import dao.QuestionDao;

public class PaperAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Paper> paperList=new ArrayList<Paper>();
	private PaperDao paperDao=new PaperDao();
	private String mainPage;
	private Paper paper;
	private String paperId;
	private List<Question> squestionList=new ArrayList<Question>();
	private List<Question> mquestionList=new ArrayList<Question>();
	private String title;
	private QuestionDao questionDao=new QuestionDao();

	
	
	
	
	

	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public List<Question> getSquestionList() {
		return squestionList;
	}



	public void setSquestionList(List<Question> squestionList) {
		this.squestionList = squestionList;
	}



	public List<Question> getMquestionList() {
		return mquestionList;
	}



	public void setMquestionList(List<Question> mquestionList) {
		this.mquestionList = mquestionList;
	}



	public Paper getPaper() {
		return paper;
	}



	public void setPaper(Paper paper) {
		this.paper = paper;
	}



	public String getPaperId() {
		return paperId;
	}



	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}



	public List<Paper> getPaperList() {
		return paperList;
	}



	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}



	public PaperDao getPaperDao() {
		return paperDao;
	}



	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}



	public String getMainPage() {
		return mainPage;
	}



	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}



	public String list() throws Exception{
		paperList=paperDao.getPaperList();
		mainPage="exam/selectPaper.jsp";
		return SUCCESS;
	}
	
	public String getDetailPaper() throws Exception{
		paper=paperDao.getPaper(paperId);
		Set<Question> questionList=paper.getQuestions();
		Iterator<Question> it=questionList.iterator();
		while(it.hasNext()){
			Question q=it.next();
			if("1".equals(q.getType())){
				squestionList.add(q);
			}else{
				mquestionList.add(q);
			}
		}
		squestionList=this.getRandomQuestion(squestionList, 3);
		mquestionList=this.getRandomQuestion(mquestionList, 2);	
		mainPage="exam/paper.jsp";
		return SUCCESS;
	}
	
	public List<Question> getRandomQuestion(List<Question> questionList,int num){
		List<Question> resultList=new ArrayList<Question>();
		Random random=new Random();
		for(int i=0;i<num;i++){
			int n=random.nextInt(questionList.size());
			Question q=questionList.get(n);
			if(resultList.contains(q)){
				i--;
			}else
				resultList.add(q);
		}
		return resultList;
	}
	
	public String paperList() throws Exception{
		paperList=paperDao.getPaperList();
		mainPage="paper/paperList.jsp";
		return SUCCESS;	
	}
	
	public String preSave() throws Exception{
		if(StringUtil.isNotEmpty(paperId)){
			paper=paperDao.getPaper(paperId);
			title="修改试卷";
		}else{
			title="添加试卷";
		}
		mainPage="paper/paperWriter.jsp";
		return SUCCESS;
	}
	
	public String savePaper() throws Exception{
		if(StringUtil.isNotEmpty(paperId)){
			paper.setId(Integer.parseInt(paperId));
		}else{
			paper.setJoinDate(new Date());
		}
		paperDao.savePaper(paper);
		return "save";
	}
	
	public String deletePaper() throws Exception{
		
		paper=paperDao.getPaper(paperId);
		JSONObject result=new JSONObject();
		if(questionDao.existQuestionByPaperId(paperId)){
			result.put("error", "试卷下有题目，不能删除");
		}else{
			paperDao.deletePaper(paper);
			result.put("success", true);
		}
		ResponseUtil.write(ServletActionContext.getResponse(), result);
		return null;
	}
	
	

}
