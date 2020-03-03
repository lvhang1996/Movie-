package action.visitor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Ma;
import model.Mc;
import model.Movie;
import model.Visitor;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import dao.BaseDao;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware{
	private String username;
	private String password;
	private String nickname;
	
	private BaseDao dao;
	private Visitor visitor;
	private Movie movie;
	
	private int id;
	private String moviename; 
	
	private Map<String,Object> session;
	private List<Movie> oneMovieList=new ArrayList<Movie>();
	private List<Ma> movieActorList=new ArrayList<Ma>();
	private List<Mc> movieCommentList=new ArrayList<Mc>();

	
	public String visitorLogin() throws Exception {
		visitor.setUsername(username);
		visitor.setPassword(password);
    	System.out.println(username+"++"+password);
		List list=dao.findOne(visitor);
    	if(list.size()==0)
    	{
    		addActionError("用户名或密码错误");
    		return INPUT;
    	}else{
    		Visitor vi=(Visitor)list.get(0);
        	session.put("vNickname", vi.getNickname());
        	session.put("vId", vi.getId());
        	session.put("vPicture", vi.getPicture());
        	session.put("vMoney", vi.getMoney());
        	session.put("login", 1);
    		return SUCCESS;
    	}
    	
    }
	
	public String visitorLoginS() throws Exception {
		System.out.println(moviename+"*"+id);
		movie=dao.findById(Movie.class,id);
		oneMovieList.add(movie);
		session.put("oneMovieList",getOneMovieList());
		
		movieActorList=dao.findMovieActor(moviename);
		session.put("movieActorList",getMovieActorList());
		
		movieCommentList=dao.findMovieComment(moviename);
		session.put("movieCommentList", getMovieCommentList());
		
		visitor.setUsername(username);
		visitor.setPassword(password);
    	System.out.println(username+"++"+password);
		List list=dao.findOne(visitor);
    	if(list.size()==0)
    	{
    		addActionError("用户名或密码错误");
    		return INPUT;
    	}else{
    		Visitor vi=(Visitor)list.get(0);
        	session.put("vNickname", vi.getNickname());
        	session.put("vId", vi.getId());
        	session.put("vPicture", vi.getPicture());
        	session.put("vMoney", vi.getMoney());
        	session.put("login", 1);
    		return SUCCESS;
    	}
    	
    }
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public Visitor getVisitor() {
		return visitor;
	}

	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
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

	public List<Movie> getOneMovieList() {
		return oneMovieList;
	}

	public void setOneMovieList(List<Movie> oneMovieList) {
		this.oneMovieList = oneMovieList;
	}

	public List<Ma> getMovieActorList() {
		return movieActorList;
	}

	public void setMovieActorList(List<Ma> movieActorList) {
		this.movieActorList = movieActorList;
	}

	public List<Mc> getMovieCommentList() {
		return movieCommentList;
	}

	public void setMovieCommentList(List<Mc> movieCommentList) {
		this.movieCommentList = movieCommentList;
	}
	
	
}
