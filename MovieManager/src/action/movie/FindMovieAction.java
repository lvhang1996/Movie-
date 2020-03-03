package action.movie;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import util.PageBean;
import model.Movie;
import com.opensymphony.xwork2.ActionSupport;
import dao.BaseDao;

@SuppressWarnings("serial")
public class FindMovieAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Movie movie;
	
	private int pageNum;
	
	private int id;
	private String moviename; 
	
	private Map<String,Object> session;
	private List<Movie> allMovieList=new ArrayList<Movie>();
	private List<Movie> oneMovieList=new ArrayList<Movie>();
	private List<Movie> movienameList=new ArrayList<Movie>();
	
	
	public String findAllMovie() throws Exception {//查找所有电影
		allMovieList=dao.findAll(Movie.class);
		
		int totalRecord=allMovieList.size();
		int pageSize=10;
				
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findMovieWithPage(startIndex, pageSize));
		session.put("moviePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allMovieList",getAllMovieList());
		return SUCCESS;
	}
	
	public String findOneMovie() throws Exception {//查找需要的电影
		movie=dao.findById(Movie.class,id);
		oneMovieList.add(movie);
		System.out.println(oneMovieList);
		session.put("oneMovieList",getOneMovieList());
		System.out.println("findOne-OK");
		return SUCCESS;
	}
	
	public String findMoviename() throws Exception {//模糊查找电影
		movienameList=dao.findMovieVague(moviename);

		int totalRecord=allMovieList.size();
		int pageSize=10;
				
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findMovieVagueWithPage(moviename, startIndex, pageSize));
		session.put("movieVaguePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("movienameList",getMovienameList());
		return SUCCESS;
	}


	public List<Movie> getAllMovieList() {
		return allMovieList;
	}

	public void setAllMovieList(List<Movie> allMovieList) {
		this.allMovieList = allMovieList;
	}
	
	public List<Movie> getOneMovieList() {
		return oneMovieList;
	}

	public void setOneMovieList(List<Movie> oneMovieList) {
		this.oneMovieList = oneMovieList;
	}
	
	public List<Movie> getMovienameList() {
		return movienameList;
	}

	public void setMovienameList(List<Movie> movienameList) {
		this.movienameList = movienameList;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
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

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	
}
