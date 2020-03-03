package action.actor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Actor;
import model.Ma;

import org.apache.struts2.interceptor.SessionAware;

import util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class FindActorAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Ma ma;
	private Actor actor;
	
	private int id;
	private String moviename; 
	private String name;
	
	private int pageNum;
	
	private Map<String,Object> session;
	private List<Ma> movieActorList=new ArrayList<Ma>();
	private List<Ma> oneMovieActorList=new ArrayList<Ma>();
	
	private List<Actor> allActorList=new ArrayList<Actor>();
	private List<Actor> actorNameList=new ArrayList<Actor>();
	private List<Actor> oneActorList=new ArrayList<Actor>();
	
	public String findMovieActor() throws Exception {
		movieActorList=dao.findMovieInActor(moviename);
		session.put("movieactorList",getMovieActorList());
		session.put("mn", moviename);
		return SUCCESS;
	}
	
	public String findOneMovieActor() throws Exception {
		ma=dao.findById(Ma.class,id);
		oneMovieActorList.add(ma);
		System.out.println(oneMovieActorList);
		session.put("oneMovieActorList",getOneMovieActorList());
		System.out.println("findOne-OK");
		return SUCCESS;
	}
	

	public String findAllActor() throws Exception {
		allActorList=dao.findAll(Actor.class);
		int totalRecord=allActorList.size();
		int pageSize=5;
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findActorWithPage(startIndex, pageSize));
		session.put("actorPage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allActorList",getAllActorList());
		return SUCCESS;
	}
	
	public String findActorName() throws Exception {
		actorNameList=dao.findActorVague(name);
		int totalRecord=actorNameList.size();
		int pageSize=5;
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findActorVagueWithPage(name,startIndex, pageSize));
		session.put("actorVaguePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("actorNameList",getActorNameList());
		return SUCCESS;
	}
	
	public String findOneActorId() throws Exception {
		actor=dao.findById(Actor.class,id);
		oneActorList.add(actor);
		System.out.println(oneActorList);
		session.put("oneActorList",getOneActorList());
		System.out.println("findOneActor-OK");
		return SUCCESS;
	}
	
	
	
	
	
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public void setMa(Ma ma) {
		this.ma = ma;
	}

	public void setActor(Actor actor) {
		this.actor = actor;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMoviename() {
		return moviename;
	}


	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Ma> getMovieActorList() {
		return movieActorList;
	}

	public void setMovieActorList(List<Ma> movieActorList) {
		this.movieActorList = movieActorList;
	}

	public List<Ma> getOneMovieActorList() {
		return oneMovieActorList;
	}

	public void setOneMovieActorList(List<Ma> oneMovieActorList) {
		this.oneMovieActorList = oneMovieActorList;
	}

	public List<Actor> getAllActorList() {
		return allActorList;
	}

	public void setAllActorList(List<Actor> allActorList) {
		this.allActorList = allActorList;
	}

	public List<Actor> getActorNameList() {
		return actorNameList;
	}

	public void setActorNameList(List<Actor> actorNameList) {
		this.actorNameList = actorNameList;
	}

	public List<Actor> getOneActorList() {
		return oneActorList;
	}

	public void setOneActorList(List<Actor> oneActorList) {
		this.oneActorList = oneActorList;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	
}
