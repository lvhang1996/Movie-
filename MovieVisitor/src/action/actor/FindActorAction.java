package action.actor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Actor;
import model.Ma;

import org.apache.struts2.interceptor.SessionAware;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;

import util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class FindActorAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Actor actor;
	private Ma ma;
	
	private int pageNum;
	
	private int id;
	private Map<String,Object> session;
	private String actorname;
	
	private String gj;
	private String country;
	
	private List<Actor> allActorList=new ArrayList<Actor>();
	private List<Actor> oneActorList=new ArrayList<Actor>();
	private List<Actor> countryActorList=new ArrayList<Actor>();
	
	private List<Ma> actorMovieList=new ArrayList<Ma>();
	
	public String findAllActor() throws Exception {
		allActorList=dao.findAll(Actor.class);
		int totalRecord=allActorList.size();
		int pageSize=20;
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findActorWithPage(startIndex, pageSize));
		session.put("actorPage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allActorList",getAllActorList());
		return SUCCESS;
	}

	public String findOneActor() throws Exception {//查找需要的演员
		actor=dao.findById(Actor.class,id);
		oneActorList.add(actor);
		System.out.println(oneActorList);
		session.put("oneActorList",getOneActorList());
		
		actorMovieList=dao.findActorMovie(actorname);
		System.out.println(actorMovieList);
		session.put("actorMovieList", getActorMovieList());
		
		return SUCCESS;
	}
	
	public String findOneActorFM() throws Exception {//查找电影里的演员
		System.out.println(actorname);
		oneActorList=dao.findActor(actorname);
		System.out.println(oneActorList);
		session.put("oneActorList",getOneActorList());
		
		actorMovieList=dao.findActorMovie(actorname);
		System.out.println(actorMovieList);
		session.put("actorMovieList", getActorMovieList());
		
		return SUCCESS;
	}
	
	public String findCountryActor() throws Exception {//查找国家演员
		System.out.println(gj);
		if(gj.equals("chn")){	country="中国";		}else if(gj.equals("us")){	country="美国";	}else if(gj.equals("jap")){	country="日本";	}
		else if(gj.equals("kor")){	country="韩国";	}else if(gj.equals("rus")){	country="俄罗斯";	}else if(gj.equals("eng")){	country="英国";	}
		else if(gj.equals("fra")){	country="法国";	}else if(gj.equals("ger")){	country="德国";	}else if(gj.equals("spa")){	country="西班牙";	}
		else if(gj.equals("itl")){	country="意大利";}else if(gj.equals("ind")){	country="印度";	}else if(gj.equals("can")){	country="加拿大";	}
		else if(gj.equals("mo")){	country="墨西哥";	}else if(gj.equals("rui")){	country="瑞典";	}else{	country="泰国";	}
		
		System.out.println("country="+country);
		countryActorList=dao.findCountryActor(country);
		
		int totalRecord=countryActorList.size();
		int pageSize=20;
			
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findCountryActorWithPage(country,startIndex, pageSize));
		session.put("actorPage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allMovieList",getAllMovieList());
		return SUCCESS;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getGj() {
		return gj;
	}

	public void setGj(String gj) {
		this.gj = gj;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public List<Actor> getAllActorList() {
		return allActorList;
	}

	public void setAllActorList(List<Actor> allActorList) {
		this.allActorList = allActorList;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setActor(Actor actor) {
		this.actor = actor;
	}

	public List<Actor> getCountryActorList() {
		return countryActorList;
	}

	public void setCountryActorList(List<Actor> countryActorList) {
		this.countryActorList = countryActorList;
	}

	public List<Actor> getOneActorList() {
		return oneActorList;
	}

	public void setOneActorList(List<Actor> oneActorList) {
		this.oneActorList = oneActorList;
	}

	public Ma getMa() {
		return ma;
	}

	public void setMa(Ma ma) {
		this.ma = ma;
	}

	public String getActorname() {
		return actorname;
	}

	public void setActorname(String actorname) {
		this.actorname = actorname;
	}

	public List<Ma> getActorMovieList() {
		return actorMovieList;
	}

	public void setActorMovieList(List<Ma> actorMovieList) {
		this.actorMovieList = actorMovieList;
	}
	
	
	
}
