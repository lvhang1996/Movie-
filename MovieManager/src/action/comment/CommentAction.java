package action.comment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.Mc;

import org.apache.struts2.interceptor.SessionAware;

import util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDao;

@SuppressWarnings("serial")
public class CommentAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Mc mc;
	
	private String moviename;
	private String comment;
	
	private Integer id;
	private String nickname;
	private String date;
	private Double score;
	
	private int pageNum;
	
	private Map<String,Object> session;
	private List<Mc> movieCommentList=new ArrayList<Mc>();
	private List<Mc> commentList=new ArrayList<Mc>();
	
	public String lookMovieComment() throws Exception {//查找电影的评论
		movieCommentList=dao.lookMovieComment(moviename);
		int totalRecord=movieCommentList.size();
		int pageSize=10;
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.lookMovieCommentWithPage(moviename, startIndex, pageSize));
		session.put("movieCommentPage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		return SUCCESS;
	}
	
	public String findMovieComment() throws Exception {//模糊查找评论
		commentList=dao.findMovieCommentVague(comment);
		session.put("co", comment);
		int totalRecord=commentList.size();
		int pageSize=10;
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findMovieCommentVagueWithPage(comment, startIndex, pageSize));
		session.put("movieCommentPage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("movienameList",getMovienameList());
		return SUCCESS;
	}

	public String updateComment() throws Exception {
		System.out.println(id+"+"+moviename+"+"+comment+"+"+nickname+"+"+date+"+"+score);
		mc.setId(id);
		mc.setComment(comment);
		mc.setDate(date);
		mc.setMoviename(moviename);
		mc.setNickname(nickname);
		mc.setScore(score);
		mc.setCaozuo("该评论已被删除，请勿发类似信息");
		dao.update(mc);
		return SUCCESS;
	}
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
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

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<Mc> getMovieCommentList() {
		return movieCommentList;
	}

	public void setMovieCommentList(List<Mc> movieCommentList) {
		this.movieCommentList = movieCommentList;
	}

	public List<Mc> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Mc> commentList) {
		this.commentList = commentList;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

}
