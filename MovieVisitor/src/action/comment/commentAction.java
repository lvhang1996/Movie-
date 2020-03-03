package action.comment;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;

import org.apache.struts2.interceptor.SessionAware;

import model.Actor;
import model.Ma;
import model.Mc;
import model.Movie;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class commentAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Mc mc;
	private Movie movie;
	private int id;
	
	private String moviename;
	private String comment;
	private String nickname;
	private String date;
	private String caozuo;
	private Double score;
	
	private Map<String,Object> session;
	private List<Movie> oneMovieList=new ArrayList<Movie>();
	private List<Ma> movieActorList=new ArrayList<Ma>();
	private List<Mc> movieCommentList=new ArrayList<Mc>();
	private List<Mc> visitorCommentList=new ArrayList<Mc>();
	
	public String addComment() throws Exception {
		System.out.println(id);
		System.out.println(moviename+"++"+comment+"++"+nickname+"++"+score);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		
		mc.setCaozuo("评论成功");
		mc.setComment(comment);
		mc.setDate(df.format(new Date()));
		mc.setMoviename(moviename);
		mc.setNickname(nickname);
		mc.setScore(score);
		System.out.println("OK");
		dao.save(mc);
		
		movie=dao.findById(Movie.class,id);
		oneMovieList.add(movie);
		session.put("oneMovieList",getOneMovieList());
		
		movieActorList=dao.findMovieActor(moviename);
		session.put("movieActorList",getMovieActorList());
		
		movieCommentList=dao.findMovieComment(moviename);
		session.put("movieCommentList", getMovieCommentList());
		
		return SUCCESS;
	}
	
	public String findComment() throws Exception {
		System.out.println(nickname);
		
		visitorCommentList=dao.findVisitorComment(nickname);
		session.put("visitorCommentList", getVisitorCommentList());
		
		return SUCCESS;
	}
	
	public String deleteComment() throws Exception {
		System.out.println(nickname+"**"+id);
		
		dao.deleteById(Mc.class,id);
		
		visitorCommentList=dao.findVisitorComment(nickname);
		session.put("visitorCommentList", getVisitorCommentList());
		
		return SUCCESS;
	}
	

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public Mc getMc() {
		return mc;
	}

	public void setMc(Mc mc) {
		this.mc = mc;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCaozuo() {
		return caozuo;
	}

	public void setCaozuo(String caozuo) {
		this.caozuo = caozuo;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
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

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
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

	public List<Mc> getVisitorCommentList() {
		return visitorCommentList;
	}

	public void setVisitorCommentList(List<Mc> visitorCommentList) {
		this.visitorCommentList = visitorCommentList;
	}
	
}
