package action.movie;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Movie;

import org.apache.struts2.interceptor.SessionAware;

import util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

public class OrderMovieAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Movie movie;
	
	private int pageNum;
	
	private int id;
	private String moviename; 
	private Map<String,Object> session;
	
	private List<Movie> orderMovieList=new ArrayList<Movie>();
	
	public String reduOrderMovie() throws Exception {
		orderMovieList=dao.findAll(Movie.class);
		
		int totalRecord=orderMovieList.size();
		int pageSize=20;
				
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findReduOrderWithPage(startIndex, pageSize));
		session.put("moviePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allMovieList",getAllMovieList());
		return SUCCESS;
	}
	
	public String shijianOrderMovie() throws Exception {
		orderMovieList=dao.findAll(Movie.class);
		
		int totalRecord=orderMovieList.size();
		int pageSize=20;
				
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findShijianOrderWithPage(startIndex, pageSize));
		session.put("moviePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allMovieList",getAllMovieList());
		return SUCCESS;
	}
	
	public String pingfenOrderMovie() throws Exception {
		orderMovieList=dao.findAll(Movie.class);
		
		int totalRecord=orderMovieList.size();
		int pageSize=20;
				
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findPingfenOrderWithPage(startIndex, pageSize));
		session.put("moviePage",pb);
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

	public List<Movie> getOrderMovieList() {
		return orderMovieList;
	}

	public void setOrderMovieList(List<Movie> orderMovieList) {
		this.orderMovieList = orderMovieList;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	
	
}
