package action.movieActor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import model.Ma;
import model.Movie;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class DeleteMovieActorAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Ma ma;
	
	private int id;
	private String moviename;
	private Map<String,Object> session;
	private List<Ma> movieActorList=new ArrayList<Ma>();
	
	public String deleteMovieActor() throws Exception {
		System.out.println(moviename);
		dao.deleteById(Ma.class,id);
		movieActorList=dao.findMovieInActor(moviename);
		session.put("movieactorList",getMovieActorList());
		session.put("mn", moviename);
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
	public void setMa(Ma ma) {
		this.ma = ma;
	}


	public String getMoviename() {
		return moviename;
	}


	public void setMoviename(String moviename) {
		this.moviename = moviename;
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
