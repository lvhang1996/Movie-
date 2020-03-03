package acion.find;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Movie;

import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import dao.BaseDao;

@SuppressWarnings("serial")
public class OrderAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Movie movie;
	
	private Map<String,Object> session;
	
	private List<Movie> movieYueList=new ArrayList<Movie>();
	private List<Movie> movieGoodList=new ArrayList<Movie>();
	private List<Movie> movieBadList=new ArrayList<Movie>();
	
	public String order() throws Exception {//查找需要的电影
		
		movieYueList=dao.findMovieYue();
		System.out.println(movieYueList);
		session.put("movieYueList",getMovieYueList());
		
		movieGoodList=dao.findMovieGood();
		System.out.println(movieGoodList);
		session.put("movieGoodList", getMovieGoodList());
		
		movieBadList=dao.findMovieBad();
		System.out.println(movieBadList);
		session.put("movieBadList", getMovieBadList());
		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
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

	public List<Movie> getMovieYueList() {
		return movieYueList;
	}

	public void setMovieYueList(List<Movie> movieYueList) {
		this.movieYueList = movieYueList;
	}

	public List<Movie> getMovieGoodList() {
		return movieGoodList;
	}

	public void setMovieGoodList(List<Movie> movieGoodList) {
		this.movieGoodList = movieGoodList;
	}

	public List<Movie> getMovieBadList() {
		return movieBadList;
	}

	public void setMovieBadList(List<Movie> movieBadList) {
		this.movieBadList = movieBadList;
	}
	
	
}
