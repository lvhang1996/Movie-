package action.movie;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import util.PageBean;
import model.Ma;
import model.Mc;
import model.Movie;
import com.opensymphony.xwork2.ActionSupport;
import dao.BaseDao;

@SuppressWarnings("serial")
public class FindMovieAction extends ActionSupport implements SessionAware{
	private BaseDao dao;
	private Movie movie;
	private Ma ma;
	private Mc mc;
	
	private int pageNum;
	
	private int id;
	private String moviename; 
	private Map<String,Object> session;
	
	private String lx;
	private String type;
	private String gj;
	private String area;
	
	
	private List<Movie> allMovieList=new ArrayList<Movie>();
	private List<Movie> oneMovieList=new ArrayList<Movie>();
	private List<Movie> movienameList=new ArrayList<Movie>();
	private List<Movie> typeMovieList=new ArrayList<Movie>();
	private List<Movie> countryMovieList=new ArrayList<Movie>();
	private List<Movie> onshowMovieList=new ArrayList<Movie>();
	
	private List<Ma> movieActorList=new ArrayList<Ma>();
	private List<Mc> movieCommentList=new ArrayList<Mc>();
	
	public String findAllMovie() throws Exception {//查找所有电影
		allMovieList=dao.findAll(Movie.class);
		
		int totalRecord=allMovieList.size();
		int pageSize=20;
		
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findMovieWithPage(startIndex, pageSize));
		session.put("moviePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		return SUCCESS;
	}
	
	public String findOneMovie() throws Exception {//查找需要的电影
		movie=dao.findById(Movie.class,id);
		oneMovieList.add(movie);
		session.put("oneMovieList",getOneMovieList());
		
		movieActorList=dao.findMovieActor(moviename);
		session.put("movieActorList",getMovieActorList());
		
		movieCommentList=dao.findMovieComment(moviename);
		session.put("movieCommentList", getMovieCommentList());
		return SUCCESS;
	}
	
	public String findTypeMovie() throws Exception {//查找类型电影
		if(lx.equals("jq")){		type="剧情";}else if(lx.equals("aq")){	type="爱情";	}else if(lx.equals("xj")){	type="喜剧";	}
		else if(lx.equals("kh")){	type="科幻";	}else if(lx.equals("dz")){	type="动作";	}else if(lx.equals("xy")){	type="悬疑";	}
		else if(lx.equals("fz")){	type="犯罪";	}else if(lx.equals("gb")){	type="恐怖";	}else{	type="战争";}
		
		
		System.out.println("type="+type);
		typeMovieList=dao.findTypeMovie(type);
		
		int totalRecord=typeMovieList.size();
		int pageSize=20;
			
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findTypeMovieWithPage(type,startIndex, pageSize));
		session.put("moviePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allMovieList",getAllMovieList());
		return SUCCESS;
	}
	
	public String findCountryMovie() throws Exception {//查找国家电影
		System.out.println(gj);
		if(gj.equals("chn")){	area="中国";		}else if(gj.equals("us")){	area="美国";	}else if(gj.equals("jap")){	area="日本";		}
		else if(gj.equals("kor")){	area="韩国";	}else if(gj.equals("rus")){	area="俄罗斯";}else if(gj.equals("eng")){	area="英国";		}
		else if(gj.equals("fra")){	area="法国";	}else if(gj.equals("ger")){	area="德国";	}else if(gj.equals("spa")){	area="西班牙";	}
		else if(gj.equals("itl")){	area="意大利";}else if(gj.equals("ind")){	area="印度";	}else if(gj.equals("can")){	area="加拿大";	}
		else if(gj.equals("mo")){	area="墨西哥";}else if(gj.equals("rui")){	area="瑞典";	}else if (gj.equals("tai")){	area="泰国";	}
		
		System.out.println("area="+area);
		countryMovieList=dao.findCountryMovie(area);
		
		int totalRecord=countryMovieList.size();
		int pageSize=20;
			
		PageBean pb=new PageBean(pageNum, pageSize, totalRecord);
		int startIndex=pb.getStartIndex();
		pb.setList(dao.findCountryMovieWithPage(area,startIndex, pageSize));
		session.put("moviePage",pb);
		session.put("totalPage",totalRecord/pageSize+1);
		//session.put("allMovieList",getAllMovieList());
		return SUCCESS;
	}

	public String findMovieDianJi() throws Exception {//查找点击的需要的电影
		System.out.println(moviename);
		
		oneMovieList=dao.findMovie(moviename);
		session.put("oneMovieList",getOneMovieList());
		
		movieActorList=dao.findMovieActor(moviename);
		session.put("movieActorList",getMovieActorList());
		
		movieCommentList=dao.findMovieComment(moviename);
		session.put("movieCommentList", getMovieCommentList());
		return SUCCESS;
	}
	
	public String findOnShow() throws Exception {//热映电影
		
		onshowMovieList=dao.findOnshowMovie();
		System.out.println(onshowMovieList);
		session.put("onshowMovieList",getOnshowMovieList());
		return SUCCESS;
	}

	public List<Movie> getAllMovieList() {
		return allMovieList;
	}

	public List<Ma> getMovieActorList() {
		return movieActorList;
	}
	
	public List<Mc> getMovieCommentList() {
		return movieCommentList;
	}

	public void setMovieCommentList(List<Mc> movieCommentList) {
		this.movieCommentList = movieCommentList;
	}

	public void setMovieActorList(List<Ma> movieActorList) {
		this.movieActorList = movieActorList;
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

	public List<Movie> getTypeMovieList() {
		return typeMovieList;
	}

	public void setTypeMovieList(List<Movie> typeMovieList) {
		this.typeMovieList = typeMovieList;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public List<Movie> getCountryMovieList() {
		return countryMovieList;
	}

	public void setCountryMovieList(List<Movie> countryMovieList) {
		this.countryMovieList = countryMovieList;
	}

	public String getGj() {
		return gj;
	}

	public void setGj(String gj) {
		this.gj = gj;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Ma getMa() {
		return ma;
	}

	public void setMa(Ma ma) {
		this.ma = ma;
	}

	public Mc getMc() {
		return mc;
	}

	public void setMc(Mc mc) {
		this.mc = mc;
	}

	public List<Movie> getOnshowMovieList() {
		return onshowMovieList;
	}

	public void setOnshowMovieList(List<Movie> onshowMovieList) {
		this.onshowMovieList = onshowMovieList;
	}
	
	
}
