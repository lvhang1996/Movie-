package action.movieActor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import model.Ma;
import dao.BaseDao;

@SuppressWarnings("serial")
public class UpdateMovieActorAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Ma ma;
	
	private Integer id;
	private String moviename;
	private String actor;
	private String role;
	
	private Map<String,Object> session;
	private List<Ma> movieActorList=new ArrayList<Ma>();
	
	public String updateMovieActor() throws Exception {
		System.out.println(id+"++"+moviename+"++"+actor+"++"+role);
		if (actor==null||actor.length()==0) {
			addActionError("表演者不为空");
    		return INPUT;
		}else if (role==null||role.length()==0) {
			addActionError("人物不为空");
    		return INPUT;
		}else {
			ma.setId(id);
			ma.setMoviename(moviename);
			ma.setActor(actor);
			ma.setRole(role);
			dao.update(ma);
			movieActorList=dao.findMovieInActor(moviename);
			session.put("movieactorList",getMovieActorList());
			session.put("mn", moviename);
			return SUCCESS;
		}
	}
	
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setMa(Ma ma) {
		this.ma = ma;
	}
	
	public Ma getMa() {
		return ma;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public List<Ma> getMovieActorList() {
		return movieActorList;
	}


	public void setMovieActorList(List<Ma> movieActorList) {
		this.movieActorList = movieActorList;
	}
	
}
