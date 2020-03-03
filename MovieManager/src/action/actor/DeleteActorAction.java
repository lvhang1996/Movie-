package action.actor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import util.PageBean;
import model.Actor;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class DeleteActorAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Actor actor;
	
	private int id;
	private String actorname;

	private int pageNum;
	
	private Map<String,Object> session;
	private List<Actor> allActorList=new ArrayList<Actor>();
	
	public String deleteActor() throws Exception {
		System.out.println(id+"+"+actorname);
		dao.deleteById(Actor.class,id);
		dao.maDeleteActor(actorname);
		allActorList=dao.findAll(Actor.class);
		int totalRecord=allActorList.size();
		int pageSize=5;
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findActorWithPage(startIndex, pageSize));
		session.put("actorPage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setActor(Actor actor) {
		this.actor = actor;
	}

	public String getActorname() {
		return actorname;
	}

	public void setActorname(String actorname) {
		this.actorname = actorname;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<Actor> getAllActorList() {
		return allActorList;
	}

	public void setAllActorList(List<Actor> allActorList) {
		this.allActorList = allActorList;
	}
	
}
