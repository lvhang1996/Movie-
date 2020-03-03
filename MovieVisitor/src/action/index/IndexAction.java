package action.index;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Movie;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

public class IndexAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Movie movie;
	
	private String hello;
	private Map<String,Object> session;
	
	private List<Movie> movieYueList=new ArrayList<Movie>();
	private List<Movie> onshowMovieList=new ArrayList<Movie>();
	private List<Movie> remenMovieList=new ArrayList<Movie>();
	
	public String index() throws Exception {//热映电影
		System.out.println(hello);
		
		onshowMovieList=dao.findIndexOnshowMovie();
		System.out.println(onshowMovieList);
		session.put("onshowMovieList",getOnshowMovieList());
		
		remenMovieList=dao.findIndexRemenMovie();
		System.out.println(remenMovieList);
		session.put("remenMovieList",getRemenMovieList());
		
		movieYueList=dao.findMovieYue();
		System.out.println(movieYueList);
		session.put("movieYueList",getMovieYueList());
		
		return SUCCESS;
	}

	
	public String getHello() {
		return hello;
	}


	public void setHello(String hello) {
		this.hello = hello;
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

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<Movie> getMovieYueList() {
		return movieYueList;
	}

	public void setMovieYueList(List<Movie> movieYueList) {
		this.movieYueList = movieYueList;
	}

	public List<Movie> getOnshowMovieList() {
		return onshowMovieList;
	}

	public void setOnshowMovieList(List<Movie> onshowMovieList) {
		this.onshowMovieList = onshowMovieList;
	}

	public List<Movie> getRemenMovieList() {
		return remenMovieList;
	}

	public void setRemenMovieList(List<Movie> remenMovieList) {
		this.remenMovieList = remenMovieList;
	}
	

}
