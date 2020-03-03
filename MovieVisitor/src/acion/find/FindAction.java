package acion.find;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Actor;
import model.Movie;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

public class FindAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Movie movie;
	private Actor actor;
	
	private Map<String,Object> session;
	private String findName;
	
	private List<Movie> findMovieList=new ArrayList<Movie>();
	private List<Actor> findActorList=new ArrayList<Actor>();
	
	
	public String find() throws Exception {//查找需要的电影
		System.out.println(findName);
		
		findMovieList=dao.findMovieVague(findName);
		System.out.println(findMovieList);
		session.put("findMovieList",getFindMovieList());
		
		findActorList=dao.findActorVague(findName);
		System.out.println(findActorList);
		session.put("findActorList", getFindActorList());
		
		return SUCCESS;
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Actor getActor() {
		return actor;
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

	public List<Movie> getFindMovieList() {
		return findMovieList;
	}

	public void setFindMovieList(List<Movie> findMovieList) {
		this.findMovieList = findMovieList;
	}

	public List<Actor> getFindActorList() {
		return findActorList;
	}

	public void setFindActorList(List<Actor> findActorList) {
		this.findActorList = findActorList;
	}

	public String getFindName() {
		return findName;
	}

	public void setFindName(String findName) {
		this.findName = findName;
	}
	
	
}
